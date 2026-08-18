from Models.Base import Base

class Employees(Base):
    def __init__(self, first_name: str, last_name: str, email: str, phone: str):
        self.FirstName = first_name
        self.LastName = last_name
        self.Email = email
        self.Phone = phone
