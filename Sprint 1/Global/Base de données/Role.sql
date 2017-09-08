USE BDPlanCadre

use BDPlanCadre

DELETE FROM AspNetRoles

INSERT INTO AspNetRoles (id, name) VALUES
(0, 'Admin'),
GO

DELETE FROM AspNetUserRoles

INSERT INTO AspNetUserRoles (UserId, RoleId) VALUES
('0c4b02f4-3c62-4030-b8e0-24aac3b87d5d', 0)

--select * from AspNetRoles
--select * from AspNetUserClaims
--select * from AspNetUserLogins
--select * from AspNetUserRoles
--select * from AspNetUsers