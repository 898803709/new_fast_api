from fastapi import APIRouter

router = APIRouter()


@router.get("/tasks")
def list_tasks():
    pass


@router.post("/tasks")
def create_task():
    pass


@router.put("/tasks/{task_id}")
def update_task():
    pass


@router.delete("/tasks/{task_id}")
def delete_task():
    pass
