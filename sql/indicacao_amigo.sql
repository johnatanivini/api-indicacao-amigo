-- Adminer 4.8.1 PostgreSQL 13.3 (Debian 13.3-1.pgdg100+1) dump

DROP TABLE IF EXISTS "contatos";
DROP SEQUENCE IF EXISTS contatos_id_seq;
CREATE SEQUENCE contatos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."contatos" (
    "id" bigint DEFAULT nextval('contatos_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "tipo_contato_id" bigint NOT NULL,
    "valor" character varying(255) NOT NULL,
    CONSTRAINT "contatos_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "contatos_valor_unique" UNIQUE ("valor")
) WITH (oids = false);

INSERT INTO "contatos" ("id", "created_at", "updated_at", "tipo_contato_id", "valor") VALUES
(1,	'2021-07-09 23:23:39',	'2021-07-09 23:23:39',	1,	'john@gmasil.com'),
(2,	'2021-07-09 23:23:39',	'2021-07-09 23:23:39',	2,	'85987543564'),
(3,	'2021-07-09 23:25:10',	'2021-07-09 23:25:10',	1,	'john@gmsasil.com'),
(4,	'2021-07-09 23:25:10',	'2021-07-09 23:25:10',	2,	'85987543698'),
(5,	'2021-07-11 11:37:49',	'2021-07-11 11:37:49',	1,	'johnatan.ivini@gmail.com'),
(6,	'2021-07-11 11:37:50',	'2021-07-11 11:37:50',	2,	'85987543565'),
(7,	'2021-07-11 15:05:27',	'2021-07-11 15:05:27',	1,	'joh@john.com'),
(8,	'2021-07-11 15:05:27',	'2021-07-11 15:05:27',	2,	'8598754356'),
(9,	'2021-07-11 19:48:52',	'2021-07-11 19:48:52',	1,	'mario@gmail.com'),
(10,	'2021-07-11 19:48:52',	'2021-07-11 19:48:52',	2,	'85987542569'),
(11,	'2021-07-11 19:49:25',	'2021-07-11 19:49:25',	1,	'aline@gmail.com'),
(12,	'2021-07-11 19:49:25',	'2021-07-11 19:49:25',	2,	'85987543568'),
(13,	'2021-07-11 20:02:34',	'2021-07-11 20:02:34',	1,	'joh@johns.com'),
(14,	'2021-07-11 20:02:34',	'2021-07-11 20:02:34',	2,	'8598754354'),
(15,	'2021-07-11 20:03:06',	'2021-07-11 20:03:06',	1,	'josh@johns.com'),
(16,	'2021-07-11 20:03:06',	'2021-07-11 20:03:06',	2,	'8598754351');

DROP TABLE IF EXISTS "failed_jobs";
DROP SEQUENCE IF EXISTS failed_jobs_id_seq;
CREATE SEQUENCE failed_jobs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."failed_jobs" (
    "id" bigint DEFAULT nextval('failed_jobs_id_seq') NOT NULL,
    "uuid" character varying(255) NOT NULL,
    "connection" text NOT NULL,
    "queue" text NOT NULL,
    "payload" text NOT NULL,
    "exception" text NOT NULL,
    "failed_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid")
) WITH (oids = false);


DROP TABLE IF EXISTS "indicacaos";
DROP SEQUENCE IF EXISTS indicacaos_id_seq;
CREATE SEQUENCE indicacaos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."indicacaos" (
    "id" bigint DEFAULT nextval('indicacaos_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "pessoa_id" bigint NOT NULL,
    "status_id" bigint NOT NULL,
    "deleted_at" timestamp(0),
    CONSTRAINT "indicacaos_pessoa_id_unique" UNIQUE ("pessoa_id"),
    CONSTRAINT "indicacaos_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "indicacaos" ("id", "created_at", "updated_at", "pessoa_id", "status_id", "deleted_at") VALUES
(3,	'2021-07-11 11:37:50',	'2021-07-11 20:10:02',	4,	3,	NULL),
(8,	'2021-07-11 20:03:06',	'2021-07-11 20:11:36',	9,	1,	NULL),
(5,	'2021-07-11 19:48:52',	'2021-07-11 20:59:13',	6,	2,	NULL),
(2,	'2021-07-09 23:25:10',	'2021-07-11 21:00:40',	3,	3,	NULL),
(7,	'2021-07-11 20:02:34',	'2021-07-11 21:02:16',	8,	2,	NULL),
(4,	'2021-07-11 15:05:27',	'2021-07-11 21:07:07',	5,	3,	NULL),
(6,	'2021-07-11 19:49:25',	'2021-07-11 21:07:13',	7,	3,	NULL),
(1,	'2021-07-09 23:23:39',	'2021-07-11 21:07:31',	2,	3,	'2021-07-11 21:07:31');

DROP TABLE IF EXISTS "migrations";
DROP SEQUENCE IF EXISTS migrations_id_seq;
CREATE SEQUENCE migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."migrations" (
    "id" integer DEFAULT nextval('migrations_id_seq') NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL,
    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(5,	'2021_07_07_233257_create_pessoas_table',	1),
(6,	'2021_07_07_233456_create_statuses_table',	1),
(7,	'2021_07_07_233700_create_indicacaos_table',	1),
(8,	'2021_07_07_233714_create_tipo_contatos_table',	1),
(9,	'2021_07_07_235102_create_contatos_table',	1),
(10,	'2021_07_07_235311_create_pessoa_contatos_table',	1);

DROP TABLE IF EXISTS "password_resets";
CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0)
) WITH (oids = false);

CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree ("email");


DROP TABLE IF EXISTS "personal_access_tokens";
DROP SEQUENCE IF EXISTS personal_access_tokens_id_seq;
CREATE SEQUENCE personal_access_tokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."personal_access_tokens" (
    "id" bigint DEFAULT nextval('personal_access_tokens_id_seq') NOT NULL,
    "tokenable_type" character varying(255) NOT NULL,
    "tokenable_id" bigint NOT NULL,
    "name" character varying(255) NOT NULL,
    "token" character varying(64) NOT NULL,
    "abilities" text,
    "last_used_at" timestamp(0),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token")
) WITH (oids = false);

CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING btree ("tokenable_type", "tokenable_id");

INSERT INTO "personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "created_at", "updated_at") VALUES
(1,	'App\Models\User',	1,	'id_token',	'd36ee1c34c52c6c9aa627600616dbfe2e46571b6f4789e6e1adccf8840d23df4',	'["*"]',	'2021-07-11 21:07:31',	'2021-07-09 23:17:01',	'2021-07-11 21:07:31');

DROP TABLE IF EXISTS "pessoa_contatos";
CREATE TABLE "public"."pessoa_contatos" (
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "pessoa_id" bigint NOT NULL,
    "contato_id" bigint NOT NULL
) WITH (oids = false);

INSERT INTO "pessoa_contatos" ("created_at", "updated_at", "pessoa_id", "contato_id") VALUES
('2021-07-09 23:23:39',	'2021-07-09 23:23:39',	2,	1),
('2021-07-09 23:23:39',	'2021-07-09 23:23:39',	2,	2),
('2021-07-09 23:25:10',	'2021-07-09 23:25:10',	3,	3),
('2021-07-09 23:25:10',	'2021-07-09 23:25:10',	3,	4),
('2021-07-11 11:37:50',	'2021-07-11 11:37:50',	4,	5),
('2021-07-11 11:37:50',	'2021-07-11 11:37:50',	4,	6),
('2021-07-11 15:05:27',	'2021-07-11 15:05:27',	5,	7),
('2021-07-11 15:05:27',	'2021-07-11 15:05:27',	5,	8),
('2021-07-11 19:48:52',	'2021-07-11 19:48:52',	6,	9),
('2021-07-11 19:48:52',	'2021-07-11 19:48:52',	6,	10),
('2021-07-11 19:49:25',	'2021-07-11 19:49:25',	7,	11),
('2021-07-11 19:49:25',	'2021-07-11 19:49:25',	7,	12),
('2021-07-11 20:02:34',	'2021-07-11 20:02:34',	8,	13),
('2021-07-11 20:02:34',	'2021-07-11 20:02:34',	8,	14),
('2021-07-11 20:03:06',	'2021-07-11 20:03:06',	9,	15),
('2021-07-11 20:03:06',	'2021-07-11 20:03:06',	9,	16);

DROP TABLE IF EXISTS "pessoas";
DROP SEQUENCE IF EXISTS pessoas_id_seq;
CREATE SEQUENCE pessoas_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."pessoas" (
    "id" bigint DEFAULT nextval('pessoas_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "deleted_at" timestamp(0),
    "nome" character varying(120) NOT NULL,
    "CPF" character varying(11) NOT NULL,
    CONSTRAINT "pessoas_cpf_unique" UNIQUE ("CPF"),
    CONSTRAINT "pessoas_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "pessoas" ("id", "created_at", "updated_at", "deleted_at", "nome", "CPF") VALUES
(2,	'2021-07-09 23:23:39',	'2021-07-09 23:23:39',	NULL,	'johns',	'01836593333'),
(3,	'2021-07-09 23:25:10',	'2021-07-09 23:25:10',	NULL,	'johns',	'61481874349'),
(4,	'2021-07-11 11:37:49',	'2021-07-11 11:37:49',	NULL,	'Johnatan',	'59559111035'),
(5,	'2021-07-11 15:05:27',	'2021-07-11 15:05:27',	NULL,	'johns',	'64329076080'),
(6,	'2021-07-11 19:48:52',	'2021-07-11 19:48:52',	NULL,	'Mario',	'15055074051'),
(7,	'2021-07-11 19:49:25',	'2021-07-11 19:49:25',	NULL,	'Aline',	'45473648002'),
(8,	'2021-07-11 20:02:34',	'2021-07-11 20:02:34',	NULL,	'johns',	'79429487060'),
(9,	'2021-07-11 20:03:06',	'2021-07-11 20:03:06',	NULL,	'Mario',	'77314412022');

DROP TABLE IF EXISTS "status";
DROP SEQUENCE IF EXISTS status_id_seq;
CREATE SEQUENCE status_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."status" (
    "id" bigint DEFAULT nextval('status_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "nome" character varying(255) NOT NULL,
    "deleted_at" timestamp(0),
    CONSTRAINT "status_nome_unique" UNIQUE ("nome"),
    CONSTRAINT "status_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "status" ("id", "created_at", "updated_at", "nome", "deleted_at") VALUES
(1,	NULL,	NULL,	'INICADA',	NULL),
(2,	NULL,	NULL,	'EM ANDAMENTO',	NULL),
(3,	NULL,	NULL,	'FINALIZADA',	NULL);

DROP TABLE IF EXISTS "tipo_contatos";
DROP SEQUENCE IF EXISTS tipo_contatos_id_seq;
CREATE SEQUENCE tipo_contatos_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."tipo_contatos" (
    "id" bigint DEFAULT nextval('tipo_contatos_id_seq') NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "nome" character varying(120) NOT NULL,
    "deleted_at" timestamp(0),
    CONSTRAINT "tipo_contatos_nome_unique" UNIQUE ("nome"),
    CONSTRAINT "tipo_contatos_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tipo_contatos" ("id", "created_at", "updated_at", "nome", "deleted_at") VALUES
(1,	NULL,	NULL,	'Email',	NULL),
(2,	NULL,	NULL,	'Telefone',	NULL);

DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;

CREATE TABLE "public"."users" (
    "id" bigint DEFAULT nextval('users_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "email_verified_at" timestamp(0),
    "password" character varying(255) NOT NULL,
    "remember_token" character varying(100),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    CONSTRAINT "users_email_unique" UNIQUE ("email"),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at") VALUES
(1,	'john',	'john@john.com',	NULL,	'$2y$10$oc.1SCz/U26BPIjFyev8UeZ6lg1nI7zJ5ESs0M/xGXVSHO79dTGlK',	NULL,	NULL,	NULL);

ALTER TABLE ONLY "public"."contatos" ADD CONSTRAINT "contatos_tipo_contato_id_foreign" FOREIGN KEY (tipo_contato_id) REFERENCES tipo_contatos(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."indicacaos" ADD CONSTRAINT "indicacaos_pessoa_id_foreign" FOREIGN KEY (pessoa_id) REFERENCES pessoas(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."indicacaos" ADD CONSTRAINT "indicacaos_status_id_foreign" FOREIGN KEY (status_id) REFERENCES status(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."pessoa_contatos" ADD CONSTRAINT "pessoa_contatos_contato_id_foreign" FOREIGN KEY (contato_id) REFERENCES contatos(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."pessoa_contatos" ADD CONSTRAINT "pessoa_contatos_pessoa_id_foreign" FOREIGN KEY (pessoa_id) REFERENCES pessoas(id) NOT DEFERRABLE;

-- 2021-07-12 00:59:01.195204+00
