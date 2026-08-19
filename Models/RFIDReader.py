from Models.BaseEntity import BaseEntity


class RFIDReader(BaseEntity):
    name: str
    serial_number: str
    door_id: int
    ip_address: str | None = None
    status_id: int