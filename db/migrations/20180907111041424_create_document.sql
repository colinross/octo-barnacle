-- +micrate Up
CREATE TABLE documents (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  description TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS documents;
