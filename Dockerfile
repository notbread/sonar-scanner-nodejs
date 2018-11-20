FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive \
    SCANNER_HOME=/sonar-scanner \
    SCANNER_VER=3.2.0.1227

ENV PATH $PATH:$SCANNER_HOME/bin

RUN apt-get update \
    && apt-get install -y \
    openjdk-8-jre-headless \
    gnupg \
    unzip \
    curl \
    jq \
    libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && curl -o sonar-scanner.zip -fSL "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SCANNER_VER}.zip" \
    && curl -o sonar-scanner.zip.asc -fSL "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SCANNER_VER}.zip.asc" \
    && unzip sonar-scanner.zip \
    && mv sonar-scanner-$SCANNER_VER /sonar-scanner \
    && rm sonar-scanner.zip* \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && update-ca-certificates -f \
    && /var/lib/dpkg/info/ca-certificates-java.postinst configure

WORKDIR /app

CMD ["sonar-scanner"]
