from pydantic import BaseModel

from Models.BaseEntity import BaseEntity


class Role(BaseEntity):
    name: str
    description: str | None = None
    is_active: bool = True