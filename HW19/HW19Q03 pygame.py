import pygame
import random
import sys

# --- 1. SETUP ---
pygame.init()
WIDTH, HEIGHT = 600, 500
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Slot Machine - Deluxe Edition")
font = pygame.font.SysFont("Arial", 28, bold=True)
small_font = pygame.font.SysFont("Arial", 18)
clock = pygame.time.Clock()

# Colors
WHITE = (255, 255, 255)
GOLD = (255, 215, 0)
BLACK = (25, 25, 25)
RED = (220, 50, 50)
GREEN = (50, 220, 50)

# Game Data
rate = [2, 3, 9, 7, 11]
image_files = ["cherries.png", "lemon.png", "star.png", "bell.png", "diamond.png"]
money = 100
wager = 5

# --- 2. LOAD ASSETS ---
try:
    symbols_imgs = [pygame.transform.scale(pygame.image.load(img).convert_alpha(), (100, 100)) for img in image_files]
except pygame.error as e:
    print(f"Error: Could not find one of the images! {e}")
    pygame.quit()
    sys.exit()


def get_multiplier(roll):
    for i in range(len(symbols_imgs)):
        if roll.count(i) == 3:
            return rate[i] * 777
        elif roll.count(i) == 2:
            return rate[i]
    return 0


# --- 3. MAIN LOOP ---
current_roll = [0, 1, 2]
message = "ARROWS TO BET | SPACE TO SPIN"
is_spinning = False

while True:
    screen.fill(BLACK)

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

        if event.type == pygame.KEYDOWN and not is_spinning:
            # Wager controls - Now changing by $1
            if event.key == pygame.K_UP:
                if wager + 1 <= money:
                    wager += 1
            if event.key == pygame.K_DOWN:
                if wager - 1 >= 0:  # Allows bet to hit 0
                    wager -= 1

            # The Spin
            if event.key == pygame.K_SPACE:
                # EXIT LOGIC: If bet is 0, close the game
                if wager == 0:
                    print(f"Cashing out with ${money}. Thanks for playing!")
                    pygame.quit()
                    sys.exit()

                # Normal Spin Logic
                if money >= wager:
                    is_spinning = True
                    message = "Spinning..."

                    # Animation shuffle
                    for _ in range(15):
                        current_roll = [random.randint(0, 4) for _ in range(3)]
                        screen.fill(BLACK)
                        for i, idx in enumerate(current_roll):
                            pygame.draw.rect(screen, WHITE, (100 + (i * 150), 150, 120, 120), 2, border_radius=10)
                            screen.blit(symbols_imgs[idx], (110 + (i * 150), 160))
                        pygame.display.flip()
                        pygame.time.delay(60)

                        # Calculate Result
                    multiplier = get_multiplier(current_roll)
                    if multiplier > 0:
                        prize = wager * multiplier
                        money += prize
                        message = f"WINNER! +${prize}"
                    else:
                        money -= wager
                        message = f"Lost ${wager}. Try again!"

                    # Auto-adjust wager if player lost money
                    if wager > money and money > 0:
                        wager = money

                    is_spinning = False

    # --- DRAWING ---
    for i in range(3):
        pygame.draw.rect(screen, WHITE, (100 + (i * 150), 150, 120, 120), 3, border_radius=12)
        screen.blit(symbols_imgs[current_roll[i]], (110 + (i * 150), 160))

    # UI Elements
    balance_txt = font.render(f"Wallet: ${money}", True, GOLD)

    # Visual feedback for Exit bet
    if wager == 0:
        wager_txt = font.render("Bet: $0 (EXIT)", True, RED)
    else:
        wager_txt = font.render(f"Bet: ${wager}", True, GREEN if money >= wager else RED)

    hint_txt = small_font.render("Arrows to adjust | Space to Spin/Exit", True, WHITE)
    msg_txt = font.render(message, True, WHITE)

    screen.blit(balance_txt, (30, 30))
    screen.blit(wager_txt, (30, 70))
    screen.blit(hint_txt, (30, 110))
    screen.blit(msg_txt, (WIDTH // 2 - msg_txt.get_width() // 2, 350))

    if money <= 0:
        game_over = font.render("BROKE!", True, RED)
        screen.blit(game_over, (WIDTH // 2 - game_over.get_width() // 2, 420))

    pygame.display.flip()
    clock.tick(60)