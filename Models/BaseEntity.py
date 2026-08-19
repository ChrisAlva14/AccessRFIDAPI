from datetime import datetime, timezone

from pydantic import BaseModel, Field


class BaseEntity(BaseModel):
    id: int | None = None
    enabled: bool = True
    created_at: datetime | None = Field(default_factory=lambda: datetime.now(timezone.utc))
    created_by: int | None = None
    updated_at: datetime | None = None
    updated_by: int | None = None