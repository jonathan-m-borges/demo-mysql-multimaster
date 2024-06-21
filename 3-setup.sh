cat <<EOF > demo.sh
#!/bin/sh
cat <<E2OF > /root/demo.sql
start replica;
exit;
E2OF
mysql -u root < /root/demo.sql
EOF
chmod +x demo.sh
docker cp demo.sh m1:/root/ && docker exec m1 /root/demo.sh
docker cp demo.sh m2:/root/ && docker exec m2 /root/demo.sh
docker cp demo.sh m3:/root/ && docker exec m3 /root/demo.sh
rm demo.sh