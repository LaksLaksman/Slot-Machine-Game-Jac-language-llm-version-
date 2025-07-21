"""Slot Machine Game"""

import random;

walker SlotGame {
    has symbols: list[str] = ["🍒", "🍋", "🍊", "🔔", "💎"];
    has reel_result: list[str];

    can start with `root entry;
    can spin with slot entry;
}

node slot {}

# CLI Entry Point
with entry:__main__ {
    root spawn SlotGame();
    root spawn SlotGame();
    root spawn SlotGame();
}
