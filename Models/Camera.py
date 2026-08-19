from Models.BaseEntity import BaseEntity


class Camera(BaseEntity):
    name: str
    ip_address: str
    door_id: int | None = None
    area_id: int | None = None
    stream_url: str | None = None
    status_id: int