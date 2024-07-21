from fastapi import APIRouter

router = APIRouter()


@router.put("/tasks/{task_id}/done")
def mark_task_as_done():
    pass


@router.delete("/tasks/{task_id}/done")
def unmark_task_as_done():
    pass
