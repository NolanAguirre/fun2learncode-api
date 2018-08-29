-- Revert ftlc:extensions from pg

BEGIN;

DROP EXTENSION citext;

DROP EXTENSION "uuid-ossp";

DROP EXTENSION pgcrypto;

COMMIT;
