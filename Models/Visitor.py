from datetime import date, datetime

from Models.BaseEntity import BaseEntity


class Visitor(BaseEntity):
    name: str
    last_name: str
    document_number: str
    company: str | None = None
    host_employee_id: int
    visit_date: date
    entry_time: datetime | None = None
    exit_time: datetime | None = None
    status_id: int