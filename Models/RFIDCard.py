from datetime import datetime

from Models.BaseEntity import BaseEntity


class RFIDCard(BaseEntity):
    card_uid: str
    card_type_id: int
    employee_id: int | None = None
    visitor_id: int | None = None
    status_id: int
    issued_at: datetime | None = None
    expires_at: datetime | None = None