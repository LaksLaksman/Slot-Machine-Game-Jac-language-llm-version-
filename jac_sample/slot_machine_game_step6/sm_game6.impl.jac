impl SlotMachine.play {
    if not [root --> (`?machine)] {
        next = root ++> machine();
    } else {
        next = [root --> (`?machine)];
    }
    visit next;
}

impl SlotMachine.spin {
    if credits <= 0 {
        print("💸 No credits left! Game over.");
        disengage;
    }

    credits -= 1;

    let all_symbols = ["🍒", "🍋", "🔔", "⭐", "7️⃣"];
    symbols = [
        all_symbols[random.randint(0, len(all_symbols) - 1)],
        all_symbols[random.randint(0, len(all_symbols) - 1)],
        all_symbols[random.randint(0, len(all_symbols) - 1)]
    ];

    print(f"🎰 You spun: {symbols}");

    if symbols[0] == symbols[1] == symbols[2] {
        result = "🎉 Jackpot! You win!";
        credits += 5;
    } else {
        result = "❌ No match. Try again!";
    }

    print(result);
    print(f"🎮 Credits left: {credits}");

    let feedback = spin_feedback(symbols);
    print(f"🤖 LLM Hint: {feedback}");

    if credits > 0 {
        here ++> machine();
        visit [-->];
    } else {
        print("🛑 Game over. No credits remaining.");
        disengage;
    }
}
