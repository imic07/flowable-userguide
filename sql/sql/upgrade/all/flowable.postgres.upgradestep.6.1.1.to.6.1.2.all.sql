update ACT_GE_PROPERTY set VALUE_ = '6.1.2.0' where NAME_ = 'schema.version';


UPDATE act_dmn_databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = '2019-03-13 21:23:38.104' WHERE ID = 1 AND LOCKED = FALSE;

UPDATE act_dmn_databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE act_fo_databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = '2019-03-13 21:23:38.647' WHERE ID = 1 AND LOCKED = FALSE;

UPDATE act_fo_databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE act_co_databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = '2019-03-13 21:23:38.769' WHERE ID = 1 AND LOCKED = FALSE;

UPDATE act_co_databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

