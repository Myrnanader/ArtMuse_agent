# main.py
from fastapi import FastAPI
from models.mood_request import MoodRequest
from agent.art_muse_agent import get_creative_idea

app = FastAPI()

@app.post("/generate-idea")
def generate_idea(request: MoodRequest):
    idea = get_creative_idea(request.mood, request.style)
    return {"idea": idea}