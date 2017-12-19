GO
CREATE TRIGGER DateTimeTrigger
ON [dbo].[Programme]
AFTER UPDATE
AS 
BEGIN
DECLARE @OldValue BIT, @NewValue BIT 
SELECT @OldValue = b.statusValider, @NewValue = a.statusValider
FROM inserted a, deleted b
   IF @NewValue != @OldValue
   UPDATE dbo.Programme
   SET dateValidation = GETDATE()
   FROM INSERTED stateValue
   WHERE stateValue.idProgramme = Programme.idProgramme 
END