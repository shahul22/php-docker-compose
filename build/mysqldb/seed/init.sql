-- Create a read-only user
CREATE USER 'readonly-user'@'%' IDENTIFIED BY 'readonly-password';
GRANT SELECT ON example-db.* TO 'readonly-user'@'%';
FLUSH PRIVILEGES;
