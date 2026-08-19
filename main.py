from fastapi import FastAPI

from Models.Employee import Employee

app = FastAPI()

@app.post("/employees")
async def create_employee(employee: Employee):
    return employee