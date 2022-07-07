# JWT token generator for Jitsi meetings in docker

The original project is in the link bellow, I just modify the interface and I added into docker container for symplicity.
https://github.com/gpopesc/emrah-tools-jwt-token/tree/main/jitsi/jitok

For docker instalation just download and rename the 2 files from above: docker-compose.yml.SAMPLE and env.SAMPLE and rename them to docker-compose.yml and .env. Adjust your variables acordingly in .env file, then run the docker-compose yp -d, then access the interface from your browser.

![image](https://user-images.githubusercontent.com/11590919/177880437-907d7254-bddf-4fd8-b2be-f31f50963daf.png)

Thisc docker build use PHPMailer(https://github.com/PHPMailer/PHPMailer) for sending the emails and Yourls (https://yourls.org/) URL shortener (optional)
