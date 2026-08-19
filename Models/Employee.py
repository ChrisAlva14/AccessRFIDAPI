from pydantic import EmailStr

from Models.BaseEntity import BaseEntity


class Employee(BaseEntity):
   name: str
   last_name: str
   email: EmailStr
   role_id: int
   status_id: int