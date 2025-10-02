# agent/art_muse_agent.py
from transformers import pipeline


generator = pipeline("text-generation", model="gpt2")

def get_creative_idea(mood: str, style: str) -> str:
    prompt = f"""
    Suggest a creative {style} project idea that fits the mood: {mood}.
    Make it original, youth-friendly, and easy to implement.
    """

    result = generator(prompt, max_length=100, do_sample=True, temperature=0.9)
    return result[0]['generated_text']