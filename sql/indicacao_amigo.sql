-- Adminer 4.8.1 PostgreSQL 13.3 (Debian 13.3-1.pgdg100+1) dump

\connect "indicacao_amigo";

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

TRUNCATE "contatos";
INSERT INTO "contatos" ("id", "created_at", "updated_at", "tipo_contato_id", "valor") VALUES
(4,	'2021-07-08 00:20:06',	'2021-07-08 00:20:06',	7,	'john@john.com'),
(6,	'2021-07-09 01:05:04',	'2021-07-09 01:05:04',	7,	'john@gmail.com'),
(7,	'2021-07-09 01:05:04',	'2021-07-09 01:05:04',	8,	'85987543565'),
(10,	'2021-07-09 01:08:29',	'2021-07-09 01:08:29',	7,	'john@gmasil.com'),
(11,	'2021-07-09 01:08:29',	'2021-07-09 01:08:29',	8,	'85987543564');

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

TRUNCATE "failed_jobs";

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

TRUNCATE "indicacaos";
INSERT INTO "indicacaos" ("id", "created_at", "updated_at", "pessoa_id", "status_id", "deleted_at") VALUES
(1,	'2021-07-08 00:12:05',	'2021-07-08 23:59:20',	1,	1,	'2021-07-08 23:59:20'),
(3,	'2021-07-09 01:05:04',	'2021-07-09 01:05:04',	3,	1,	NULL),
(4,	'2021-07-09 01:08:29',	'2021-07-09 01:08:29',	8,	1,	NULL);

DROP TABLE IF EXISTS "migrations";
DROP SEQUENCE IF EXISTS migrations_id_seq;
CREATE SEQUENCE migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."migrations" (
    "id" integer DEFAULT nextval('migrations_id_seq') NOT NULL,
    "migration" character varying(255) NOT NULL,
    "batch" integer NOT NULL,
    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

TRUNCATE "migrations";
INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2021_07_07_233257_create_pessoas_table',	2),
(5,	'2021_07_07_233456_create_statuses_table',	2),
(6,	'2021_07_07_233700_create_indicacaos_table',	2),
(7,	'2021_07_07_233714_create_tipo_contatos_table',	2),
(8,	'2021_07_07_235102_create_contatos_table',	2),
(9,	'2021_07_07_235311_create_pessoa_contatos_table',	2),
(10,	'2019_12_14_000001_create_personal_access_tokens_table',	3);

DROP TABLE IF EXISTS "password_resets";
CREATE TABLE "public"."password_resets" (
    "email" character varying(255) NOT NULL,
    "token" character varying(255) NOT NULL,
    "created_at" timestamp(0)
) WITH (oids = false);

CREATE INDEX "password_resets_email_index" ON "public"."password_resets" USING btree ("email");

TRUNCATE "password_resets";

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

TRUNCATE "personal_access_tokens";
INSERT INTO "personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "created_at", "updated_at") VALUES
(1,	'App\Models\User',	1,	'id_token',	'fd9f1ef847dc1ef71d01340bd794919250d3ae5817347a7a53caf4989ad62887',	'["*"]',	NULL,	'2021-07-08 22:22:02',	'2021-07-08 22:22:02'),
(2,	'App\Models\User',	1,	'id_token',	'f7893455e0e4bcd4350927755180d603c62cc9e6fd93cbc54fe33248fdd4c7ea',	'["*"]',	NULL,	'2021-07-08 22:35:09',	'2021-07-08 22:35:09'),
(3,	'App\Models\User',	1,	'id_token',	'863258fd9b4aab90f8fa4fd1c79adc829c3f287e1472d9195b0df8cea4e64370',	'["*"]',	NULL,	'2021-07-08 22:35:10',	'2021-07-08 22:35:10'),
(4,	'App\Models\User',	1,	'id_token',	'2b8df1bb55d017462b3ed398090a24e1d666f1a861ad8dc21eeddaa41de4446f',	'["*"]',	NULL,	'2021-07-08 22:35:11',	'2021-07-08 22:35:11'),
(5,	'App\Models\User',	1,	'id_token',	'de6078a03aaba9bccb76c508809dbbc7b969ac090433037f76989c48dece0f5c',	'["*"]',	'2021-07-09 00:04:06',	'2021-07-08 22:35:13',	'2021-07-09 00:04:06');

DROP TABLE IF EXISTS "pessoa_contatos";
CREATE TABLE "public"."pessoa_contatos" (
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "pessoa_id" bigint NOT NULL,
    "contato_id" bigint NOT NULL
) WITH (oids = false);

TRUNCATE "pessoa_contatos";
INSERT INTO "pessoa_contatos" ("created_at", "updated_at", "pessoa_id", "contato_id") VALUES
('2021-07-08 00:22:10',	'2021-07-08 00:22:10',	1,	4),
('2021-07-09 01:05:04',	'2021-07-09 01:05:04',	3,	6),
('2021-07-09 01:05:04',	'2021-07-09 01:05:04',	3,	7),
('2021-07-09 01:08:29',	'2021-07-09 01:08:29',	8,	10),
('2021-07-09 01:08:29',	'2021-07-09 01:08:29',	8,	11);

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

TRUNCATE "pessoas";
INSERT INTO "pessoas" ("id", "created_at", "updated_at", "deleted_at", "nome", "CPF") VALUES
(1,	'2021-07-08 00:10:24',	'2021-07-08 00:10:24',	NULL,	'john',	'01269589933'),
(3,	'2021-07-09 01:05:04',	'2021-07-09 01:05:04',	NULL,	'johns',	'01836593333'),
(8,	'2021-07-09 01:08:29',	'2021-07-09 01:08:29',	NULL,	'johns',	'61481874349');

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

TRUNCATE "status";
INSERT INTO "status" ("id", "created_at", "updated_at", "nome", "deleted_at") VALUES
(1,	'2021-07-08 00:11:03',	'2021-07-08 00:11:03',	'INICIADA',	NULL),
(2,	'2021-07-08 00:11:11',	'2021-07-08 00:11:11',	'EM ANDAMENTO',	NULL),
(3,	'2021-07-08 00:11:21',	'2021-07-08 00:11:21',	'FINALIZADA',	NULL);

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

TRUNCATE "tipo_contatos";
INSERT INTO "tipo_contatos" ("id", "created_at", "updated_at", "nome", "deleted_at") VALUES
(7,	'2021-07-08 00:17:36',	'2021-07-08 00:17:36',	'Email',	NULL),
(8,	'2021-07-09 03:36:00',	'2021-07-09 03:36:00',	'Telefone',	NULL);

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

TRUNCATE "users";
INSERT INTO "users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at") VALUES
(1,	'john',	'john@john.com',	NULL,	'$2y$10$1wNAP9u6sZRx9RpxO1ArLOc8UDGSkPly694UvpfwaVJx1266W7nBO',	NULL,	NULL,	NULL);

ALTER TABLE ONLY "public"."contatos" ADD CONSTRAINT "contatos_tipo_contato_id_foreign" FOREIGN KEY (tipo_contato_id) REFERENCES tipo_contatos(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."indicacaos" ADD CONSTRAINT "indicacaos_pessoa_id_foreign" FOREIGN KEY (pessoa_id) REFERENCES pessoas(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."indicacaos" ADD CONSTRAINT "indicacaos_status_id_foreign" FOREIGN KEY (status_id) REFERENCES status(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."pessoa_contatos" ADD CONSTRAINT "pessoa_contatos_contato_id_foreign" FOREIGN KEY (contato_id) REFERENCES contatos(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."pessoa_contatos" ADD CONSTRAINT "pessoa_contatos_pessoa_id_foreign" FOREIGN KEY (pessoa_id) REFERENCES pessoas(id) NOT DEFERRABLE;

-- 2021-07-09 04:17:00.708927+00
