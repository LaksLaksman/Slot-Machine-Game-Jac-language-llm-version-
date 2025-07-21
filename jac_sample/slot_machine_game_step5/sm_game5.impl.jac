impl SlotGame.start {
    if not [root --> (`?slot)] {
        next = root ++> slot();
    } else {
        next = [root --> (`?slot)];
    }
    visit next;
}

impl SlotGame.spin {
    reel_result = [];
    for i = 0 to i < 3 by i += 1 {
        reel_result.append(symbols[random.randint(0, len(symbols) - 1)]);
    }

    print("🎰 " + " | ".join(reel_result));

    if reel_result[0] == reel_result[1] == reel_result[2] {
        print("🎉 JACKPOT! You won!");
    } elif reel_result[0] == reel_result[1] or reel_result[1] == reel_result[2] or reel_result[0] == reel_result[2] {
        print("✨ Nice! You got a small win.");
    } else {
        print("💀 Better luck next time.");
    }

    disengage;
}
