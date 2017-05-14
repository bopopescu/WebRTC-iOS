# Launch AWS Turn server

http://www.jianshu.com/p/c55ecf5a3fcf

54.70.162.232
1. Find ami-id and launch instance in AWS

2. In management console find public ip
chmod 400 coturn-key.pem
ssh -i "coturn-key.pem" ec2-user@ec2-52-32-134-226.us-west-2.compute.amazonaws.com

3. Adding admin accounts
turnadmin -a -r votebin.com -u votebin -p votebin123

4. Starting the service
```
// Create certificate
sudo openssl req -x509 -newkey rsa:2048 -keyout /etc/turn_server_pkey.pem -out /etc/turn_server_cert.pem -days 99999 -nodes
// Add turnserver.conf

sudo su
service iptables restart

service coturn start

# turnserver -L ec2-52-32-134-226.us-west-2.compute.amazonaws.com -v -a -f -r votebin.com
```

ec2-52-32-134-226.us-west-2.compute.amazonaws.com/turn?username=votebin&key=4080218913


5. To securely copy certificates
```
scp -i coturn-key.pem goletsencrypt ec2-user@ec2-52-32-134-226.us-west-2.compute.amazonaws.com:~/
```