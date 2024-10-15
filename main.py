import os
from fastapi import FastAPI

from dotenv import load_dotenv

from settings import Settings

load_dotenv()

app = FastAPI()


if not os.environ.get("POSTGRES_PASSWORD", None):
    os.environ["POSTGRES_PASSWORD"] = ""

settings = Settings()

print(settings.POSTGRES_URL)


@app.get("/")
def home():
    return {"Hello": "World"}


@app.get("/about")
def about():
    return {"About": "This is a FastAPI app"}


@app.get("/contact")
def contact():
    return {"Contact": "[email protected]"}
