from fastapi import FastAPI

from api.routers import done, task

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


app.include_router(task.router)
app.include_router(done.router)
