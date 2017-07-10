FROM quay.io/aptible/nodejs:v4.6.x
MAINTAINER Javier Ailbirt.

RUN apt-get update && apt-get install -y --no-install-recommends \
    mongodb-clients \
    git-core \
    libkrb5-dev \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/bitpay/copay.git
WORKDIR /copay

RUN npm install -g bitcore-wallet
RUN npm run apply:copay

CMD npm start
