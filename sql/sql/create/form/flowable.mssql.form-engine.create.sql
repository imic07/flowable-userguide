

CREATE TABLE [ACT_FO_DATABASECHANGELOGLOCK] ([ID] [int] NOT NULL, [LOCKED] [bit] NOT NULL, [LOCKGRANTED] [datetime2](3), [LOCKEDBY] [nvarchar](255), CONSTRAINT [PK_ACT_FO_DATABASECHANGELOGLOCK] PRIMARY KEY ([ID]))

DELETE FROM [ACT_FO_DATABASECHANGELOGLOCK]

INSERT INTO [ACT_FO_DATABASECHANGELOGLOCK] ([ID], [LOCKED]) VALUES (1, 0)

UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 1, [LOCKEDBY] = '192.168.1.5 (192.168.1.5)', [LOCKGRANTED] = '2019-03-13T21:45:43.219' WHERE [ID] = 1 AND [LOCKED] = 0

CREATE TABLE [ACT_FO_DATABASECHANGELOG] ([ID] [nvarchar](255) NOT NULL, [AUTHOR] [nvarchar](255) NOT NULL, [FILENAME] [nvarchar](255) NOT NULL, [DATEEXECUTED] [datetime2](3) NOT NULL, [ORDEREXECUTED] [int] NOT NULL, [EXECTYPE] [nvarchar](10) NOT NULL, [MD5SUM] [nvarchar](35), [DESCRIPTION] [nvarchar](255), [COMMENTS] [nvarchar](255), [TAG] [nvarchar](255), [LIQUIBASE] [nvarchar](20), [CONTEXTS] [nvarchar](255), [LABELS] [nvarchar](255), [DEPLOYMENT_ID] [nvarchar](10))

CREATE TABLE [ACT_FO_FORM_DEPLOYMENT] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOY_TIME_] [datetime], [TENANT_ID_] [varchar](255), [PARENT_DEPLOYMENT_ID_] [varchar](255), CONSTRAINT [PK_ACT_FO_FORM_DEPLOYMENT] PRIMARY KEY ([ID_]))

CREATE TABLE [ACT_FO_FORM_RESOURCE] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [RESOURCE_BYTES_] [varbinary](MAX), CONSTRAINT [PK_ACT_FO_FORM_RESOURCE] PRIMARY KEY ([ID_]))

CREATE TABLE [ACT_FO_FORM_DEFINITION] ([ID_] [varchar](255) NOT NULL, [NAME_] [varchar](255), [VERSION_] [int], [KEY_] [varchar](255), [CATEGORY_] [varchar](255), [DEPLOYMENT_ID_] [varchar](255), [PARENT_DEPLOYMENT_ID_] [varchar](255), [TENANT_ID_] [varchar](255), [RESOURCE_NAME_] [varchar](255), [DESCRIPTION_] [varchar](255), CONSTRAINT [PK_ACT_FO_FORM_DEFINITION] PRIMARY KEY ([ID_]))

CREATE TABLE [ACT_FO_FORM_INSTANCE] ([ID_] [varchar](255) NOT NULL, [FORM_DEFINITION_ID_] [varchar](255) NOT NULL, [TASK_ID_] [varchar](255), [PROC_INST_ID_] [varchar](255), [PROC_DEF_ID_] [varchar](255), [SUBMITTED_DATE_] [datetime], [SUBMITTED_BY_] [varchar](255), [FORM_VALUES_ID_] [varchar](255), [TENANT_ID_] [varchar](255), CONSTRAINT [PK_ACT_FO_FORM_INSTANCE] PRIMARY KEY ([ID_]))

INSERT INTO [ACT_FO_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', GETDATE(), 1, '7:252bd5cb28cf86685ed67eb15d910118', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509943288')

ALTER TABLE [ACT_FO_FORM_INSTANCE] ADD [SCOPE_ID_] [varchar](255)

ALTER TABLE [ACT_FO_FORM_INSTANCE] ADD [SCOPE_TYPE_] [varchar](255)

ALTER TABLE [ACT_FO_FORM_INSTANCE] ADD [SCOPE_DEFINITION_ID_] [varchar](255)

INSERT INTO [ACT_FO_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', GETDATE(), 2, '7:4850f9311e7503d7ea30a372e79b4ea2', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509943288')

ALTER TABLE [ACT_FO_FORM_DEFINITION] DROP COLUMN [PARENT_DEPLOYMENT_ID_]

INSERT INTO [ACT_FO_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', GETDATE(), 3, '7:6d80a1fd28201ae354e73bd7c5cf8595', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509943288')

CREATE UNIQUE NONCLUSTERED INDEX ACT_IDX_FORM_DEF_UNIQ ON [ACT_FO_FORM_DEFINITION]([KEY_], [VERSION_], [TENANT_ID_])

INSERT INTO [ACT_FO_DATABASECHANGELOG] ([ID], [AUTHOR], [FILENAME], [DATEEXECUTED], [ORDEREXECUTED], [MD5SUM], [DESCRIPTION], [COMMENTS], [EXECTYPE], [CONTEXTS], [LABELS], [LIQUIBASE], [DEPLOYMENT_ID]) VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', GETDATE(), 4, '7:80b47424c1d564a692fc8923633f78e4', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '2509943288')

UPDATE [ACT_FO_DATABASECHANGELOGLOCK] SET [LOCKED] = 0, [LOCKEDBY] = NULL, [LOCKGRANTED] = NULL WHERE [ID] = 1

