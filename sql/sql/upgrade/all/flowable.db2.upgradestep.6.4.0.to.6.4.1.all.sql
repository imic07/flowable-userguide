create table ACT_HI_TSK_LOG (
  ID_ bigint not null GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  TYPE_ varchar(64),
  TASK_ID_ varchar(64) not null,
  TIME_STAMP_ timestamp not null,
  USER_ID_ varchar(255),
  DATA_ varchar(4000),
  EXECUTION_ID_ varchar(64),
  PROC_INST_ID_ varchar(64),
  PROC_DEF_ID_ varchar(64),
  SCOPE_ID_ varchar(255),
  SCOPE_DEFINITION_ID_ varchar(255),
  SUB_SCOPE_ID_ varchar(255),
  SCOPE_TYPE_ varchar(255),
  TENANT_ID_ varchar(255) default '',
  primary key (ID_)
);

create table ACT_RU_ENTITYLINK (
    ID_ varchar(64) not null,
    REV_ integer,
    CREATE_TIME_ timestamp,
    LINK_TYPE_ varchar(255),
    SCOPE_ID_ varchar(255),
    SCOPE_TYPE_ varchar(255),
    SCOPE_DEFINITION_ID_ varchar(255),
    REF_SCOPE_ID_ varchar(255),
    REF_SCOPE_TYPE_ varchar(255),
    REF_SCOPE_DEFINITION_ID_ varchar(255),
    HIERARCHY_TYPE_ varchar(255),
    primary key (ID_)
);

create index ACT_IDX_ENT_LNK_SCOPE on ACT_RU_ENTITYLINK(SCOPE_ID_, SCOPE_TYPE_, LINK_TYPE_);
create index ACT_IDX_ENT_LNK_SCOPE_DEF on ACT_RU_ENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_, LINK_TYPE_);

create table ACT_HI_ENTITYLINK (
    ID_ varchar(64) not null,
    LINK_TYPE_ varchar(255),
    CREATE_TIME_ timestamp,
    SCOPE_ID_ varchar(255),
    SCOPE_TYPE_ varchar(255),
    SCOPE_DEFINITION_ID_ varchar(255),
    REF_SCOPE_ID_ varchar(255),
    REF_SCOPE_TYPE_ varchar(255),
    REF_SCOPE_DEFINITION_ID_ varchar(255),
    HIERARCHY_TYPE_ varchar(255),
    primary key (ID_)
);

create index ACT_IDX_HI_ENT_LNK_SCOPE on ACT_HI_ENTITYLINK(SCOPE_ID_, SCOPE_TYPE_, LINK_TYPE_);
create index ACT_IDX_HI_ENT_LNK_SCOPE_DEF on ACT_HI_ENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_, LINK_TYPE_);

update ACT_GE_PROPERTY set VALUE_ = '6.4.1.3' where NAME_ = 'common.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.4.1.3' where NAME_ = 'task.schema.version';

insert into ACT_GE_PROPERTY values ('entitylink.schema.version', '6.4.1.3', 1);

update ACT_GE_PROPERTY set VALUE_ = '6.4.1.3' where NAME_ = 'job.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.4.1.3' where NAME_ = 'identitylink.schema.version';

update ACT_GE_PROPERTY set VALUE_ = '6.4.1.3' where NAME_ = 'variable.schema.version';
create table ACT_RU_ACTINST (
    ID_ varchar(64) not null,
    REV_ integer default 1,
    PROC_DEF_ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    EXECUTION_ID_ varchar(64) not null,
    ACT_ID_ varchar(255) not null,
    TASK_ID_ varchar(64),
    CALL_PROC_INST_ID_ varchar(64),
    ACT_NAME_ varchar(255),
    ACT_TYPE_ varchar(255) not null,
    ASSIGNEE_ varchar(255),
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create index ACT_IDX_RU_ACTI_START on ACT_RU_ACTINST(START_TIME_);
create index ACT_IDX_RU_ACTI_END on ACT_RU_ACTINST(END_TIME_);
create index ACT_IDX_RU_ACTI_PROC on ACT_RU_ACTINST(PROC_INST_ID_);
create index ACT_IDX_RU_ACTI_PROC_ACT on ACT_RU_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_RU_ACTI_EXEC on ACT_RU_ACTINST(EXECUTION_ID_);
create index ACT_IDX_RU_ACTI_EXEC_ACT on ACT_RU_ACTINST(EXECUTION_ID_, ACT_ID_);

delete
from ACT_RU_VARIABLE
where TYPE_ in ('item', 'message')
  and BYTEARRAY_ID_ is null
  and DOUBLE_ is null
  and LONG_ is null
  and TEXT_ is null
  and TEXT2_ is null;

delete
from ACT_RU_VARIABLE
where TYPE_ = 'null'
  and NAME_ in ('org.activiti.engine.impl.bpmn.CURRENT_MESSAGE', 'org.flowable.engine.impl.bpmn.CURRENT_MESSAGE');

update ACT_GE_PROPERTY set VALUE_ = '6.4.1.3' where NAME_ = 'schema.version';

delete
from ACT_HI_VARINST
where VAR_TYPE_ in ('item', 'message')
  and BYTEARRAY_ID_ is null
  and DOUBLE_ is null
  and LONG_ is null
  and TEXT_ is null
  and TEXT2_ is null;

delete from ACT_HI_VARINST
where VAR_TYPE_ = 'null'
and NAME_ in ('org.activiti.engine.impl.bpmn.CURRENT_MESSAGE', 'org.flowable.engine.impl.bpmn.CURRENT_MESSAGE');

UPDATE ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = TIMESTAMP('2019-03-13 21:59:03.169') WHERE ID = 1 AND LOCKED = 0;

CREATE UNIQUE INDEX ACT_IDX_APP_DEF_UNIQ ON ACT_APP_APPDEF(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', CURRENT TIMESTAMP, 2, '7:4ef4a0a9e9cfb636c22126d540cdd38e', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', 'EXECUTED', NULL, NULL, '3.5.3', '2510743857');

UPDATE ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = TIMESTAMP('2019-03-13 21:59:04.292') WHERE ID = 1 AND LOCKED = 0;

CREATE UNIQUE INDEX ACT_IDX_CASE_DEF_UNIQ ON ACT_CMMN_CASEDEF(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', CURRENT TIMESTAMP, 5, '7:2b33c819a1ef81d793f7ef82bed8b1ac', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', 'EXECUTED', NULL, NULL, '3.5.3', '2510744482');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST RENAME COLUMN START_TIME_ TO CREATE_TIME_;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST RENAME COLUMN CREATED_TIME_ TO CREATE_TIME_;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_AVAILABLE_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_ENABLED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_DISABLED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_STARTED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_SUSPENDED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD COMPLETED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD OCCURRED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD TERMINATED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXIT_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ENDED_TIME_ TIMESTAMP;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ENTRY_CRITERION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXIT_CRITERION_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_RU_PLAN_ITEM_INST');

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD ENTRY_CRITERION_ID_ VARCHAR(255);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD EXIT_CRITERION_ID_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CMMN_HI_PLAN_ITEM_INST');

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', CURRENT TIMESTAMP, 6, '7:ff6d918908599427d849c1f3b109cf1c', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', 'EXECUTED', NULL, NULL, '3.5.3', '2510744482');

UPDATE ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = TIMESTAMP('2019-03-13 21:59:05.583') WHERE ID = 1 AND LOCKED = 0;

CREATE UNIQUE INDEX ACT_IDX_DEC_TBL_UNIQ ON ACT_DMN_DECISION_TABLE(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', CURRENT TIMESTAMP, 5, '7:c44cb06af8977c776a4e93aebe96c568', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.5.3', '2510745727');

UPDATE ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = TIMESTAMP('2019-03-13 21:59:06.089') WHERE ID = 1 AND LOCKED = 0;

CREATE UNIQUE INDEX ACT_IDX_FORM_DEF_UNIQ ON ACT_FO_FORM_DEFINITION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', CURRENT TIMESTAMP, 4, '7:80b47424c1d564a692fc8923633f78e4', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '2510746243');

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = TIMESTAMP('2019-03-13 21:59:06.622') WHERE ID = 1 AND LOCKED = 0;

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

