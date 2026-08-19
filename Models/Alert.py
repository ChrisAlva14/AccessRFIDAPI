from Models.BaseEntity import BaseEntity


class Alert(BaseEntity):
    alert_type_id: int
    message: str
    door_id: int | None = None
    employee_id: int | None = None
    access_event_id: int | None = None
    is_resolved: bool = False