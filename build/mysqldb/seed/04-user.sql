-- Create a read-only user
CREATE USER 'demo-user'@'%' IDENTIFIED BY 'demo-password';
GRANT SELECT ON docker.* TO 'demo-user'@'%';
FLUSH PRIVILEGES;
