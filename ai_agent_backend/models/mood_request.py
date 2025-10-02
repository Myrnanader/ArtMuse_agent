from pydantic import BaseModel

class MoodRequest(BaseModel):
    mood: str
    style: str