-- Create a read-only user
CREATE USER 'readonly-user'@'%' IDENTIFIED BY 'readonly-password';
GRANT SELECT ON docker.* TO 'readonly-user'@'%';
FLUSH PRIVILEGES;
