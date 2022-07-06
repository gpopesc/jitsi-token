#!/bin/bash
exec >> /tmp/startup.log 2>&1
cp /tmp/smtp/* /var/www/html

if [ -n "${USER_NAME}" ]
 then
  echo "Running as user ${USER_NAME} with id ${UID} and groupid ${GID}"
  #set default root password
  groupadd -f -g ${GID} users
  groupmod -g ${GID} users
  useradd -u ${UID} -g ${GID} -m -p $(openssl passwd -1 ${USER_PASSWORD}) -s /bin/bash -G sudo ${USER_NAME}
  find /home/${USER_NAME} -path /home/${USER_NAME}/share -prune -o -exec chown ${UID}:${GID} {} \;
  usermod -a -G root ${USER_NAME} && usermod -a -G audio ${USER_NAME} && usermod -a -G users ${USER_NAME}
  export HOME=/home/${USER_NAME}
  echo ${USER_PASSWORD} | sudo -u ${USER_NAME} -S mkdir -p /home/${USER_NAME}/script
  cp /tmp/script/* /home/${USER_NAME}/script/ && chmod 775 -R /home/${USER_NAME}/script/*
  tar -xf /var/www/html/smtp-html.zip.tar.xz
  chown ${UID}:${GID} -R /var/www/html/*
  chmod 755 -R /var/www/html/*
  rm -v /var/www/html/smtp-html.zip.tar.xz
  a2enmod rewrite

  sh /home/${USER_NAME}/script/deno.sh
  if [ -e "/home/${USER_NAME}/.bashrc" ]
    then
  echo ".bashrc exist --> skipping"
    else
  echo "cd /home/${USER_NAME}" >> ~/.bashrc
  fi
  echo "===========> script finnished <============" & \
  sh /home/${USER_NAME}/script/jitok.sh & \
  /usr/sbin/apache2ctl -D FOREGROUND
  
 else
  echo "no user name has been defined"
  exit
fi
rm -rf /tmp/config 

echo "===========> Done <============"
