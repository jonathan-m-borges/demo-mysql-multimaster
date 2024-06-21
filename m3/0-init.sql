CREATE USER 'repl'@'%' IDENTIFIED BY 'repl';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
SET @@GLOBAL.enforce_gtid_consistency = WARN;
SET @@GLOBAL.enforce_gtid_consistency = ON;
SET @@GLOBAL.gtid_mode = OFF_PERMISSIVE;
SET @@GLOBAL.gtid_mode = ON_PERMISSIVE;