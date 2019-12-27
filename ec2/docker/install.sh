#!/bin/sh
useradd isow && mkdir /home/isow/.ssh && chown 700 /home/isow/.ssh && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4HsdsnkNa/Czac5duRGzD39BcFFd7407kY7s1dRfGBabccv7UXNyjRJ1weMxYpj5GWwv0AXxA9Se4rndysM2jELWFGNE8OxHZJE8SXB3dU+yjlT03na6SGk87OKmEEAYO5Q1PXkwfrhUZbLkPRyoZukbU72W9O9gznFFas+HEsCDkTaPhmwfVlOWHDzqFQj7Q3cSMrJu+1sErh1yyir/uweruuC4u5hqYutm9KDdNXH2EYFlPFf5l5rr7A0nvOJEF5nDk2INQTM5VB8TJJ7JbaCNijVpc2ixj1kxSwt5c8hKM8rBMpilMNB+gkk0inWo3Jxv4rn076mOba8NuMTPio/9ukUDl2UcOJkmXpAJdcC9IdnNLNH0z9bROej999bUVolcMn4DaGq+LDaVXW6cEMRl3/k0hy5PJ5J9j2/AawjElD4uNAPAndgNxVmU1Dc2CZ0b/Z5lrAmUAx2tOHw76tgN2BTdYKSgkEIPif+ygcOIurh5QZYY3U5W2IUouAoNmuehFKZ8gPS6DRBcnq9uLJ5V9TjcVOcUSQp3cziZ6zJYIp161zIo0QGxmNj/lALke++2gCETul2jxyLxiFjdtXmJwo6nxeky2caMg0j4P1YR0fq/mJKMW5fokwFnovdstSbN0RlaY7zgNIgT1bmwOHixFd89GJdgUDlsfEqz8JQ== ibrahim.sow@mutex-exterieur.fr" > /home/isow/.ssh/authorized_keys && chmod 600 /home/isow/.ssh/authorized_keys && chown -R isow:isow /home/isow

# Ajout des user isow
usermod -aG wheel isow
usermod -aG adm isow

# Ajout du groupe wheel pour faire un sudo sans qu'on leur réclame un password

echo "%wheel  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers


amazon-linux-extras install epel
yum update -y
yum install nginx -y

systemctl enable nginx

systemctl start nginx

# Ai changé le nom du bucket dans le script car il existe déjà chez GFI : ai changé mutex en mutex-er
# Ajout du fichier ihm conf dans le script le 30 Novembre 2018 suite au email de Nicolas du 15 Novembre 2018
# sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/tomcat1.conf /etc/nginx/default.d/tomcat1.conf
# sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/traefik.conf /etc/nginx/default.d/traefik.conf
# sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/nsi.conf /etc/nginx/default.d/nsi.conf
# sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/keycloak.conf /etc/nginx/default.d/keycloak.conf
# sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/nginx.conf /etc/nginx/nginx.conf

# sudo aws s3 cp s3://mutex-er-recette-configuration/nginx/ihm.conf /etc/nginx/default.d/ihm.conf




mkdir /etc/ssl/private
openssl req -x509 -nodes -days 900 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/O=Global Security/OU=Epargne Retraite Department/CN=Mutex.fr"

systemctl reload nginx

#Installation openjdk 10
sudo curl https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz -o openjdk-10.0.2_linux-x64_bin.tar.gz

sudo tar zxf openjdk-10.0.2_linux-x64_bin.tar.gz -C /usr/local
sudo mv /usr/local/jdk-10.0.2 /usr/local/jdk-10
sudo alternatives --install /usr/bin/java java /usr/local/jdk-10/bin/java 1

sudo alternatives --install /usr/bin/jar jar /usr/local/jdk-10/bin/jar 1
sudo alternatives --install /usr/bin/javac javac /usr/local/jdk-10/bin/javac 1
sudo alternatives --set jar /usr/local/jdk-10/bin/jar
sudo alternatives --set javac /usr/local/jdk-10/bin/javac


