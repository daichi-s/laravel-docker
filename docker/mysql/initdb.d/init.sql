CREATE DATABASE IF NOT EXISTS db;

-- CREATE user 'docker'@'%' identified BY 'docker';
GRANT ALL ON *.* TO docker@'%';

-- 旧認証方式で暗号化。
-- CREATE user 'docker'@'%' identified WITH mysql_native_password BY 'docker';