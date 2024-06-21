cat <<EOF > demo.sh
#!/bin/sh
cat <<E2OF > /root/demo.sql
CHANGE REPLICATION SOURCE TO SOURCE_HOST="m1", SOURCE_USER="repl", SOURCE_PASSWORD="repl", SOURCE_AUTO_POSITION=1 FOR CHANNEL "m1";
exit;
E2OF
mysql -u root < /root/demo.sql
EOF
chmod +x demo.sh
docker cp demo.sh m2:/root/ && docker exec m2 /root/demo.sh
docker cp demo.sh m3:/root/ && docker exec m3 /root/demo.sh
rm demo.sh

cat <<EOF > demo.sh
#!/bin/sh
cat <<E2OF > /root/demo.sql
CHANGE REPLICATION SOURCE TO SOURCE_HOST="m2", SOURCE_USER="repl", SOURCE_PASSWORD="repl", SOURCE_AUTO_POSITION=1 FOR CHANNEL "m2";
exit;
E2OF
mysql -u root < /root/demo.sql
EOF
chmod +x demo.sh
docker cp demo.sh m1:/root/ && docker exec m1 /root/demo.sh
docker cp demo.sh m3:/root/ && docker exec m3 /root/demo.sh
rm demo.sh

cat <<EOF > demo.sh
#!/bin/sh
cat <<E2OF > /root/demo.sql
CHANGE REPLICATION SOURCE TO SOURCE_HOST="m3", SOURCE_USER="repl", SOURCE_PASSWORD="repl", SOURCE_AUTO_POSITION=1 FOR CHANNEL "m3";
exit;
E2OF
mysql -u root < /root/demo.sql
EOF
chmod +x demo.sh
docker cp demo.sh m1:/root/ && docker exec m1 /root/demo.sh
docker cp demo.sh m2:/root/ && docker exec m2 /root/demo.sh
rm demo.sh
