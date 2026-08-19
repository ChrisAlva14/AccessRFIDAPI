IF DB_ID(N'access_rfid_db') IS NULL
BEGIN
    CREATE DATABASE access_rfid_db;
END;
GO

USE access_rfid_db;
GO

-- Catalog tables
CREATE TABLE dbo.cat_employee_status
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_employee_status PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_employee_status_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_employee_status_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_employee_status_name UNIQUE (name)
);

CREATE TABLE dbo.cat_area_type
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_area_type PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_area_type_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_area_type_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_area_type_name UNIQUE (name)
);

CREATE TABLE dbo.cat_card_type
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_card_type PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_card_type_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_card_type_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_card_type_name UNIQUE (name)
);

CREATE TABLE dbo.cat_card_status
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_card_status PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_card_status_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_card_status_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_card_status_name UNIQUE (name)
);

CREATE TABLE dbo.cat_access_result
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_access_result PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_access_result_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_access_result_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_access_result_name UNIQUE (name)
);

CREATE TABLE dbo.cat_access_direction
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_access_direction PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_access_direction_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_access_direction_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_access_direction_name UNIQUE (name)
);

CREATE TABLE dbo.cat_permission_type
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_permission_type PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_permission_type_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_permission_type_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_permission_type_name UNIQUE (name)
);

CREATE TABLE dbo.cat_door_status
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_door_status PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_door_status_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_door_status_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_door_status_name UNIQUE (name)
);

CREATE TABLE dbo.cat_device_status
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_device_status PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_device_status_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_device_status_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_device_status_name UNIQUE (name)
);

CREATE TABLE dbo.cat_alert_type
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_alert_type PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_alert_type_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_alert_type_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_alert_type_name UNIQUE (name)
);

CREATE TABLE dbo.cat_visit_status
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cat_visit_status PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cat_visit_status_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cat_visit_status_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_cat_visit_status_name UNIQUE (name)
);
GO

-- Main tables
CREATE TABLE dbo.roles
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_roles PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    description NVARCHAR(500) NULL,
    is_active   BIT NOT NULL CONSTRAINT df_roles_is_active DEFAULT (1),
    enabled     BIT NOT NULL CONSTRAINT df_roles_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_roles_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_roles_name UNIQUE (name)
);

CREATE TABLE dbo.employees
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_employees PRIMARY KEY,
    name        NVARCHAR(100) NOT NULL,
    last_name   NVARCHAR(100) NOT NULL,
    email       NVARCHAR(255) NOT NULL,
    role_id     INT NOT NULL,
    status_id   INT NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_employees_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_employees_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT uq_employees_email UNIQUE (email),
    CONSTRAINT fk_employees_role FOREIGN KEY (role_id) REFERENCES dbo.roles(id),
    CONSTRAINT fk_employees_status FOREIGN KEY (status_id) REFERENCES dbo.cat_employee_status(id)
);

CREATE TABLE dbo.areas
(
    id            INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_areas PRIMARY KEY,
    name          NVARCHAR(150) NOT NULL,
    area_type_id  INT NOT NULL,
    description   NVARCHAR(500) NULL,
    is_restricted BIT NOT NULL CONSTRAINT df_areas_is_restricted DEFAULT (0),
    enabled       BIT NOT NULL CONSTRAINT df_areas_enabled DEFAULT (1),
    created_at    DATETIME2(3) NOT NULL CONSTRAINT df_areas_created_at DEFAULT (SYSUTCDATETIME()),
    created_by    INT NULL,
    updated_at    DATETIME2(3) NULL,
    updated_by    INT NULL,
    CONSTRAINT uq_areas_name UNIQUE (name),
    CONSTRAINT fk_areas_type FOREIGN KEY (area_type_id) REFERENCES dbo.cat_area_type(id)
);

CREATE TABLE dbo.doors
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_doors PRIMARY KEY,
    name        NVARCHAR(150) NOT NULL,
    area_id     INT NOT NULL,
    status_id   INT NOT NULL,
    is_active   BIT NOT NULL CONSTRAINT df_doors_is_active DEFAULT (1),
    enabled     BIT NOT NULL CONSTRAINT df_doors_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_doors_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT fk_doors_area FOREIGN KEY (area_id) REFERENCES dbo.areas(id),
    CONSTRAINT fk_doors_status FOREIGN KEY (status_id) REFERENCES dbo.cat_door_status(id)
);

CREATE TABLE dbo.rfid_readers
(
    id            INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_rfid_readers PRIMARY KEY,
    name          NVARCHAR(150) NOT NULL,
    serial_number NVARCHAR(100) NOT NULL,
    door_id       INT NOT NULL,
    ip_address    VARCHAR(45) NULL,
    status_id     INT NOT NULL,
    enabled       BIT NOT NULL CONSTRAINT df_rfid_readers_enabled DEFAULT (1),
    created_at    DATETIME2(3) NOT NULL CONSTRAINT df_rfid_readers_created_at DEFAULT (SYSUTCDATETIME()),
    created_by    INT NULL,
    updated_at    DATETIME2(3) NULL,
    updated_by    INT NULL,
    CONSTRAINT uq_rfid_readers_serial_number UNIQUE (serial_number),
    CONSTRAINT fk_rfid_readers_door FOREIGN KEY (door_id) REFERENCES dbo.doors(id),
    CONSTRAINT fk_rfid_readers_status FOREIGN KEY (status_id) REFERENCES dbo.cat_device_status(id)
);

CREATE TABLE dbo.visitors
(
    id               INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_visitors PRIMARY KEY,
    name             NVARCHAR(100) NOT NULL,
    last_name        NVARCHAR(100) NOT NULL,
    document_number  NVARCHAR(50) NOT NULL,
    company          NVARCHAR(150) NULL,
    host_employee_id INT NOT NULL,
    visit_date       DATE NOT NULL,
    entry_time       DATETIME2(3) NULL,
    exit_time        DATETIME2(3) NULL,
    status_id        INT NOT NULL,
    enabled          BIT NOT NULL CONSTRAINT df_visitors_enabled DEFAULT (1),
    created_at       DATETIME2(3) NOT NULL CONSTRAINT df_visitors_created_at DEFAULT (SYSUTCDATETIME()),
    created_by       INT NULL,
    updated_at       DATETIME2(3) NULL,
    updated_by       INT NULL,
    CONSTRAINT fk_visitors_host_employee FOREIGN KEY (host_employee_id) REFERENCES dbo.employees(id),
    CONSTRAINT fk_visitors_status FOREIGN KEY (status_id) REFERENCES dbo.cat_visit_status(id)
);

CREATE TABLE dbo.rfid_cards
(
    id           INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_rfid_cards PRIMARY KEY,
    card_uid     NVARCHAR(100) NOT NULL,
    card_type_id INT NOT NULL,
    employee_id  INT NULL,
    visitor_id   INT NULL,
    status_id    INT NOT NULL,
    issued_at    DATETIME2(3) NULL,
    expires_at   DATETIME2(3) NULL,
    enabled      BIT NOT NULL CONSTRAINT df_rfid_cards_enabled DEFAULT (1),
    created_at   DATETIME2(3) NOT NULL CONSTRAINT df_rfid_cards_created_at DEFAULT (SYSUTCDATETIME()),
    created_by   INT NULL,
    updated_at   DATETIME2(3) NULL,
    updated_by   INT NULL,
    CONSTRAINT uq_rfid_cards_card_uid UNIQUE (card_uid),
    CONSTRAINT ck_rfid_cards_owner CHECK ((employee_id IS NOT NULL AND visitor_id IS NULL) OR (employee_id IS NULL AND visitor_id IS NOT NULL)),
    CONSTRAINT fk_rfid_cards_type FOREIGN KEY (card_type_id) REFERENCES dbo.cat_card_type(id),
    CONSTRAINT fk_rfid_cards_employee FOREIGN KEY (employee_id) REFERENCES dbo.employees(id),
    CONSTRAINT fk_rfid_cards_visitor FOREIGN KEY (visitor_id) REFERENCES dbo.visitors(id),
    CONSTRAINT fk_rfid_cards_status FOREIGN KEY (status_id) REFERENCES dbo.cat_card_status(id)
);

CREATE TABLE dbo.cameras
(
    id          INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_cameras PRIMARY KEY,
    name        NVARCHAR(150) NOT NULL,
    ip_address  VARCHAR(45) NOT NULL,
    door_id     INT NULL,
    area_id     INT NULL,
    stream_url  NVARCHAR(500) NULL,
    status_id   INT NOT NULL,
    enabled     BIT NOT NULL CONSTRAINT df_cameras_enabled DEFAULT (1),
    created_at  DATETIME2(3) NOT NULL CONSTRAINT df_cameras_created_at DEFAULT (SYSUTCDATETIME()),
    created_by  INT NULL,
    updated_at  DATETIME2(3) NULL,
    updated_by  INT NULL,
    CONSTRAINT ck_cameras_location CHECK (door_id IS NOT NULL OR area_id IS NOT NULL),
    CONSTRAINT fk_cameras_door FOREIGN KEY (door_id) REFERENCES dbo.doors(id),
    CONSTRAINT fk_cameras_area FOREIGN KEY (area_id) REFERENCES dbo.areas(id),
    CONSTRAINT fk_cameras_status FOREIGN KEY (status_id) REFERENCES dbo.cat_device_status(id)
);

CREATE TABLE dbo.access_permissions
(
    id                 INT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_access_permissions PRIMARY KEY,
    employee_id        INT NOT NULL,
    area_id            INT NULL,
    door_id            INT NULL,
    permission_type_id INT NOT NULL,
    valid_from         DATETIME2(3) NULL,
    valid_until        DATETIME2(3) NULL,
    is_active          BIT NOT NULL CONSTRAINT df_access_permissions_is_active DEFAULT (1),
    enabled            BIT NOT NULL CONSTRAINT df_access_permissions_enabled DEFAULT (1),
    created_at         DATETIME2(3) NOT NULL CONSTRAINT df_access_permissions_created_at DEFAULT (SYSUTCDATETIME()),
    created_by         INT NULL,
    updated_at         DATETIME2(3) NULL,
    updated_by         INT NULL,
    CONSTRAINT ck_access_permissions_target CHECK (area_id IS NOT NULL OR door_id IS NOT NULL),
    CONSTRAINT ck_access_permissions_dates CHECK (valid_until IS NULL OR valid_from IS NULL OR valid_until >= valid_from),
    CONSTRAINT fk_access_permissions_employee FOREIGN KEY (employee_id) REFERENCES dbo.employees(id),
    CONSTRAINT fk_access_permissions_area FOREIGN KEY (area_id) REFERENCES dbo.areas(id),
    CONSTRAINT fk_access_permissions_door FOREIGN KEY (door_id) REFERENCES dbo.doors(id),
    CONSTRAINT fk_access_permissions_type FOREIGN KEY (permission_type_id) REFERENCES dbo.cat_permission_type(id)
);

CREATE TABLE dbo.access_events
(
    id                   BIGINT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_access_events PRIMARY KEY,
    employee_id          INT NULL,
    visitor_id           INT NULL,
    card_id              INT NULL,
    reader_id            INT NOT NULL,
    door_id              INT NOT NULL,
    result_id            INT NOT NULL,
    direction_id         INT NOT NULL,
    event_time           DATETIME2(3) NOT NULL CONSTRAINT df_access_events_event_time DEFAULT (SYSUTCDATETIME()),
    denial_reason        NVARCHAR(500) NULL,
    camera_evidence_url  NVARCHAR(500) NULL,
    enabled              BIT NOT NULL CONSTRAINT df_access_events_enabled DEFAULT (1),
    created_at           DATETIME2(3) NOT NULL CONSTRAINT df_access_events_created_at DEFAULT (SYSUTCDATETIME()),
    created_by           INT NULL,
    updated_at           DATETIME2(3) NULL,
    updated_by           INT NULL,
    CONSTRAINT fk_access_events_employee FOREIGN KEY (employee_id) REFERENCES dbo.employees(id),
    CONSTRAINT fk_access_events_visitor FOREIGN KEY (visitor_id) REFERENCES dbo.visitors(id),
    CONSTRAINT fk_access_events_card FOREIGN KEY (card_id) REFERENCES dbo.rfid_cards(id),
    CONSTRAINT fk_access_events_reader FOREIGN KEY (reader_id) REFERENCES dbo.rfid_readers(id),
    CONSTRAINT fk_access_events_door FOREIGN KEY (door_id) REFERENCES dbo.doors(id),
    CONSTRAINT fk_access_events_result FOREIGN KEY (result_id) REFERENCES dbo.cat_access_result(id),
    CONSTRAINT fk_access_events_direction FOREIGN KEY (direction_id) REFERENCES dbo.cat_access_direction(id)
);

CREATE TABLE dbo.alerts
(
    id              BIGINT IDENTITY(1, 1) NOT NULL CONSTRAINT pk_alerts PRIMARY KEY,
    alert_type_id   INT NOT NULL,
    message         NVARCHAR(500) NOT NULL,
    door_id         INT NULL,
    employee_id     INT NULL,
    access_event_id BIGINT NULL,
    is_resolved     BIT NOT NULL CONSTRAINT df_alerts_is_resolved DEFAULT (0),
    enabled         BIT NOT NULL CONSTRAINT df_alerts_enabled DEFAULT (1),
    created_at      DATETIME2(3) NOT NULL CONSTRAINT df_alerts_created_at DEFAULT (SYSUTCDATETIME()),
    created_by      INT NULL,
    updated_at      DATETIME2(3) NULL,
    updated_by      INT NULL,
    CONSTRAINT fk_alerts_type FOREIGN KEY (alert_type_id) REFERENCES dbo.cat_alert_type(id),
    CONSTRAINT fk_alerts_door FOREIGN KEY (door_id) REFERENCES dbo.doors(id),
    CONSTRAINT fk_alerts_employee FOREIGN KEY (employee_id) REFERENCES dbo.employees(id),
    CONSTRAINT fk_alerts_access_event FOREIGN KEY (access_event_id) REFERENCES dbo.access_events(id)
);
GO

-- Initial catalog data
INSERT INTO dbo.cat_employee_status (name) VALUES
(N'active'), (N'inactive'), (N'suspended');

INSERT INTO dbo.cat_area_type (name) VALUES
(N'production'), (N'laboratory'), (N'warehouse'), (N'office'), (N'restricted');

INSERT INTO dbo.cat_card_type (name) VALUES
(N'employee'), (N'visitor'), (N'temporary');

INSERT INTO dbo.cat_card_status (name) VALUES
(N'active'), (N'blocked'), (N'lost'), (N'expired');

INSERT INTO dbo.cat_access_result (name) VALUES
(N'authorized'), (N'denied');

INSERT INTO dbo.cat_access_direction (name) VALUES
(N'entry'), (N'exit');

INSERT INTO dbo.cat_permission_type (name) VALUES
(N'entry'), (N'exit'), (N'entry_and_exit');

INSERT INTO dbo.cat_door_status (name) VALUES
(N'open'), (N'closed'), (N'locked'), (N'forced');

INSERT INTO dbo.cat_device_status (name) VALUES
(N'online'), (N'offline'), (N'maintenance');

INSERT INTO dbo.cat_alert_type (name) VALUES
(N'unauthorized_access'), (N'forced_door'), (N'door_left_open'), (N'device_offline');

INSERT INTO dbo.cat_visit_status (name) VALUES
(N'scheduled'), (N'in_progress'), (N'completed'), (N'cancelled');
GO

-- Indexes for dashboard and access history queries
CREATE INDEX ix_access_events_event_time ON dbo.access_events (event_time DESC);
CREATE INDEX ix_access_events_door_id_event_time ON dbo.access_events (door_id, event_time DESC);
CREATE INDEX ix_access_events_employee_id_event_time ON dbo.access_events (employee_id, event_time DESC);
CREATE INDEX ix_alerts_is_resolved_created_at ON dbo.alerts (is_resolved, created_at DESC);
CREATE INDEX ix_visitors_visit_date ON dbo.visitors (visit_date);
GO