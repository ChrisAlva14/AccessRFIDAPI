from datetime import datetime, timezone

from pydantic import Field

from Models.BaseEntity import BaseEntity


class AccessEvent(BaseEntity):
    employee_id: int | None = None
    visitor_id: int | None = None
    card_id: int | None = None
    reader_id: int
    door_id: int
    result_id: int
    direction_id: int
    event_time: datetime = Field(default_factory=lambda: datetime.now(timezone.utc))
    denial_reason: str | None = None
    camera_evidence_url: str | None = None