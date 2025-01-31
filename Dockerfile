FROM node:18.20.6
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
RUN apt-get update && \
    apt-get install -y --only-upgrade git=1:2.20.1-2+deb10u9 && \
    apt-get install -y --only-upgrade git-man=1:2.20.1-2+deb10u9 && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --only-upgrade -y zlib1g zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*  # Cleanup
COPY graphserver.js .
EXPOSE  4000
CMD ["node", "graphserver.js"]
