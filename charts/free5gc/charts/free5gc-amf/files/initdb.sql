CREATE DATABASE channels;
GRANT ALL PRIVILEGES ON DATABASE channels TO postgres;
\c channels;
CREATE TABLE channels (
  id serial PRIMARY KEY,
  public_did VARCHAR (50) NOT NULL,
  nf_type VARCHAR(50) NOT NULL,
  connection_id VARCHAR(50) NOT NULL,
  authenticated BOOLEAN NOT NULL,
  authorization_consumer BOOLEAN NOT NULL,
  authorization_producer BOOLEAN NOT NULL
);
