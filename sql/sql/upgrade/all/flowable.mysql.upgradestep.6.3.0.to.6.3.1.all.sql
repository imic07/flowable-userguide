update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'task.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'variable.schema.version';

alter table ACT_RU_HISTORY_JOB add column SCOPE_TYPE_ varchar(255);

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'job.schema.version';
alter table ACT_RE_DEPLOYMENT add column PARENT_DEPLOYMENT_ID_ varchar(255);

update ACT_GE_PROPERTY set VALUE_ = '6.3.1.0' where NAME_ = 'schema.version';


CREATE TABLE `flowable-sql`.ACT_APP_DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_ACT_APP_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM `flowable-sql`.ACT_APP_DATABASECHANGELOGLOCK;

INSERT INTO `flowable-sql`.ACT_APP_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE `flowable-sql`.ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.3.118 (192.168.3.118)', LOCKGRANTED = '2019-05-23 13:37:42.452' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE `flowable-sql`.ACT_APP_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE `flowable-sql`.ACT_APP_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, KEY_ VARCHAR(255) NULL, DEPLOY_TIME_ datetime NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_APP_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE `flowable-sql`.ACT_APP_DEPLOYMENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_BYTES_ LONGBLOB NULL, CONSTRAINT PK_APP_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE `flowable-sql`.ACT_APP_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_APP_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES `flowable-sql`.ACT_APP_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_APP_RSRC_DPL ON `flowable-sql`.ACT_APP_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE `flowable-sql`.ACT_APP_APPDEF (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, NAME_ VARCHAR(255) NULL, KEY_ VARCHAR(255) NOT NULL, VERSION_ INT NOT NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_NAME_ VARCHAR(4000) NULL, DESCRIPTION_ VARCHAR(4000) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_APP_APPDEF PRIMARY KEY (ID_));

ALTER TABLE `flowable-sql`.ACT_APP_APPDEF ADD CONSTRAINT ACT_FK_APP_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES `flowable-sql`.ACT_APP_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_APP_DEF_DPLY ON `flowable-sql`.ACT_APP_APPDEF(DEPLOYMENT_ID_);

INSERT INTO `flowable-sql`.ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', NOW(), 1, '7:ec9776f6c57a3953c7d27499108df3d1', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', 'EXECUTED', NULL, NULL, '3.5.3', '8589863042');

UPDATE `flowable-sql`.ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE `flowable-sql`.ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.3.118 (192.168.3.118)', LOCKGRANTED = '2019-05-23 13:37:43.325' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE `flowable-sql`.ACT_CMMN_HI_PLAN_ITEM_INST (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, NAME_ VARCHAR(255) NULL, STATE_ VARCHAR(255) NULL, CASE_DEF_ID_ VARCHAR(255) NULL, CASE_INST_ID_ VARCHAR(255) NULL, STAGE_INST_ID_ VARCHAR(255) NULL, IS_STAGE_ BIT(1) NULL, ELEMENT_ID_ VARCHAR(255) NULL, ITEM_DEFINITION_ID_ VARCHAR(255) NULL, ITEM_DEFINITION_TYPE_ VARCHAR(255) NULL, CREATED_TIME_ datetime NULL, LAST_AVAILABLE_TIME_ datetime NULL, LAST_ENABLED_TIME_ datetime NULL, LAST_DISABLED_TIME_ datetime NULL, LAST_STARTED_TIME_ datetime NULL, LAST_SUSPENDED_TIME_ datetime NULL, COMPLETED_TIME_ datetime NULL, OCCURRED_TIME_ datetime NULL, TERMINATED_TIME_ datetime NULL, EXIT_TIME_ datetime NULL, ENDED_TIME_ datetime NULL, LAST_UPDATED_TIME_ datetime NULL, START_USER_ID_ VARCHAR(255) NULL, REFERENCE_ID_ VARCHAR(255) NULL, REFERENCE_TYPE_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_CMMN_HI_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE `flowable-sql`.ACT_CMMN_RU_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '' NULL;

ALTER TABLE `flowable-sql`.ACT_CMMN_HI_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '' NULL;

INSERT INTO `flowable-sql`.ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 4, '7:894e6e444f72422bf34e4ade89dc8451', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '8589863409');

UPDATE `flowable-sql`.ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE `flowable-sql`.ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.3.118 (192.168.3.118)', LOCKGRANTED = '2019-05-23 13:37:43.612' WHERE ID = 1 AND LOCKED = 0;

ALTER TABLE `flowable-sql`.ACT_DMN_DECISION_TABLE DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO `flowable-sql`.ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 4, '7:b8d3d5a3efb71aef7578e1130a38fde2', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.5.3', '8589863649');

UPDATE `flowable-sql`.ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE `flowable-sql`.ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.3.118 (192.168.3.118)', LOCKGRANTED = '2019-05-23 13:37:43.729' WHERE ID = 1 AND LOCKED = 0;

ALTER TABLE `flowable-sql`.ACT_FO_FORM_DEFINITION DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO `flowable-sql`.ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 3, '7:6d80a1fd28201ae354e73bd7c5cf8595', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '8589863756');

UPDATE `flowable-sql`.ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE `flowable-sql`.ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.3.118 (192.168.3.118)', LOCKGRANTED = '2019-05-23 13:37:43.835' WHERE ID = 1 AND LOCKED = 0;

UPDATE `flowable-sql`.ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

