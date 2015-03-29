CREATE SEQUENCE observation_seq;
CREATE SEQUENCE observationpayload_seq;

CREATE TABLE observation_tbl(
  id NUMERIC NOT NULL PRIMARY KEY DEFAULT NEXTVAL( 'observation_seq' ),
  app_key VARCHAR NOT NULL,
  mon_key VARCHAR NOT NULL,
  sent TIMESTAMP NOT NULL,
  received TIMESTAMP NOT NULL DEFAULT NOW() );

CREATE TABLE observationpayload_tbl (
  id NUMERIC NOT NULL PRIMARY KEY DEFAULT NEXTVAL( 'observationpayload_seq' ),
  observation_id NUMERIC,
  key VARCHAR,
  value VARCHAR,
  CONSTRAINT observationpaylad_observation_fk FOREIGN KEY ( observation_id ) REFERENCES observation_tbl( id ) );

