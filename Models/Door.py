from Models.BaseEntity import BaseEntity


class Door(BaseEntity):
    name: str
    area_id: int
    status_id: int
    is_active: bool = True