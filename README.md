# sonar-scanner-nodejs
Sonar scanner with nodejs 8

[![Build Status](https://travis-ci.com/notbread/sonar-scanner-nodejs.svg?branch=master)](https://travis-ci.com/notbread/sonar-scanner-nodejs)



```bash
git clone https://github.com/notbread/sonar-scanner-nodejs.git
cd sonar-scanner-nodejs
docker build -t sonar-scanner-nodejs .
docker run -v /path/to/ts-js/code/:/app \
 sonar-scanner-nodejs \
 npm install && \
 sonar-scanner \
  -X \
  -Dsonar.projectKey=api \
  -Dsonar.host.url=$SONAR_URL \
  -Dsonar.projectVersion=1 \
  -Dsonar.login=$SONAR_API_KEY \
  -Dsonar.sources=.
 ```
