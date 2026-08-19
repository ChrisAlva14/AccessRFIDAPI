from datetime import datetime

from Models.BaseEntity import BaseEntity


class AccessPermission(BaseEntity):
    employee_id: int
    area_id: int | None = None
    door_id: int | None = None
    permission_type_id: int
    valid_from: datetime | None = None
    valid_until: datetime | None = None
    is_active: bool = True