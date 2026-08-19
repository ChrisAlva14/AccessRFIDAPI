from Models.BaseEntity import BaseEntity


class Area(BaseEntity):
    name: str
    area_type_id: int
    description: str | None = None
    is_restricted: bool = False