from fastapi import FastAPI
from Models.Employees import Employees

app = FastAPI();

@app.get("/")
async def root():
    return {"message": "Welcome Christopher to the AccessRFID API"}


@app.get("/{name}")
async def greeting(name:str):
    return {"message": "Hello there " + name}

@app.get("/employees")
async def get_employees():
    employee = Employees.query.all()
    return {"employees": [employee.json() for employee in employee]}