cat <<EOF > demo.sh
#!/bin/sh
cat <<E2OF > /root/demo.sql
SET @@GLOBAL.enforce_gtid_consistency = WARN;
SET @@GLOBAL.enforce_gtid_consistency = ON;
SET @@GLOBAL.gtid_mode = OFF_PERMISSIVE;
SET @@GLOBAL.gtid_mode = ON_PERMISSIVE;
exit;
E2OF
mysql -u root < /root/demo.sql
EOF
chmod +x demo.sh
docker cp demo.sh m1:/root/ && docker exec m1 /root/demo.sh
docker cp demo.sh m2:/root/ && docker exec m2 /root/demo.sh
docker cp demo.sh m3:/root/ && docker exec m3 /root/demo.sh
rm demo.sh

cat <<EOF > demo.sh
#!/bin/sh
cat <<E2OF > /root/demo.sql
SET @@GLOBAL.gtid_mode = ON;
exit;
E2OF
mysql -u root < /root/demo.sql
EOF
chmod +x demo.sh
docker cp demo.sh m1:/root/ && docker exec m1 /root/demo.sh
docker cp demo.sh m2:/root/ && docker exec m2 /root/demo.sh
docker cp demo.sh m3:/root/ && docker exec m3 /root/demo.sh
rm demo.sh
