first conn
cat <<EOF > demo.sh
#!/bin/sh
cat <<E2OF > /root/demo.sql
show databases;
exit;
E2OF
mysql -u repl -prepl -h m1 < /root/demo.sql
mysql -u repl -prepl -h m2 < /root/demo.sql
mysql -u repl -prepl -h m3 < /root/demo.sql
EOF
chmod +x demo.sh
docker cp demo.sh m1:/root/ && docker exec m1 /root/demo.sh
docker cp demo.sh m2:/root/ && docker exec m2 /root/demo.sh
docker cp demo.sh m3:/root/ && docker exec m3 /root/demo.sh
rm demo.sh
