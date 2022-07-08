# JWT token generator for Jitsi meetings in docker

The original project is in the link bellow, I just modify the interface and I added into docker container for simplicity.
[https://github.com/emrahcom/emrah-tools](https://github.com/emrahcom/emrah-tools)


For docker installation just download and rename the 2 files from above: *docker-compose.yml.SAMPLE* and *.env.SAMPLE* and rename them to *docker-compose.yml* and *.env* Adjust your variables accordingly in .env file, then run the *docker-compose up -d*, then access the interface from your browser.

![image](https://user-images.githubusercontent.com/11590919/177880437-907d7254-bddf-4fd8-b2be-f31f50963daf.png)

This docker build use PHPMailer(https://github.com/PHPMailer/PHPMailer) for sending the emails and Yourls (https://yourls.org/) URL shortener (optional)

Install your jitsi meeting in docker from here: https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-docker/
