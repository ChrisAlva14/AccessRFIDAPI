from datetime import datetime

class Base:
    def __init__(self, id: int, created_at: datetime, created_by: int, updated_at: datetime, updated_by: int):
        self.Id = id
        self.CreatedAt = created_at
        self.UpdatedAt = updated_at
        self.CreatedBy = created_by
        self.UpdatedBy = updated_by