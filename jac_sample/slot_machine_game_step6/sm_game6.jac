"""A Slot Machine Game"""

import random;
import from mtllm.llms { OpenAI, Gemini }

# glob llm = OpenAI(model_name="gpt-4o", verbose=False);
glob llm = Gemini(model_name="gemini-1.5-flash", verbose=False);

"""Provide a fun message after a spin"""
def spin_feedback(symbols: list[str]) -> str byllm();

walker SlotMachine {
    has credits: int = 3;
    has symbols: list[str];
    has result: str;

    can play with `root entry;
    can spin with machine entry;
}

node machine {}

# Entry point
with entry:__main__ {
    root spawn SlotMachine();
}
