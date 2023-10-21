-- Create a read-only user
CREATE USER 'readonlyuser'@'%' IDENTIFIED BY 'readonly-password';
GRANT SELECT ON docker.* TO 'readonlyuser'@'%';
FLUSH PRIVILEGES;
