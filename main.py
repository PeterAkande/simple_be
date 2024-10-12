from fastapi import FastAPI


app = FastAPI()


@app.get("/")
def home():
    return {"Hello": "World"}


@app.get("/about")
def about():
    return {"About": "This is a FastAPI app"}


@app.get("/contact")
def contact():
    return {"Contact": "[email protected]"}
