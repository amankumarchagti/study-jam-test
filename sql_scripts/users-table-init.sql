CREATE TABLE USERS
(
    id INT NOT NULL IDENTITY(1, 1),
    username VARCHAR(64) NOT NULL,
    password_hash VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO dbo.users
    (username, password_hash)
VALUES
    ('admin', 'pbkdf2:sha256:150000$sEdEc2S1$029e0f38851be885b2bb4a7533469be98691926f4ddc89a1c68d0358cee619f2')


'pbkdf2:sha256:150000$sEdEc2S1$029e0f38851be885b2bb4a7533469be98691926f4ddc89a1c68d0358cee619f2'

#default
VALUES
('admin', 'pbkdf2:sha256:150000$QlIrz6Hg$5f4cd25d78a6c79906a53f74ef5d3bb2609af2b39d9e5dd6f3beabd8c854dd60')

# study jam
'pbkdf2:sha256:150000$sEdEc2S1$029e0f38851be885b2bb4a7533469be98691926f4ddc89a1c68d0358cee619f2'