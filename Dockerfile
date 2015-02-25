FROM ubuntu:14.04
MAINTAINER Gordon Lawrenz <lawrenz@dbis.rwth-aachen.de>
ENV DEBIAN_FRONTEND noninteractive

# Update & Intall Node.js, Npm 
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	npm \
	nodejs
	&& npm install -g npm

# Copy App
ADD ./src/hello.js /opt/hello.js
ADD ./src/package.json  /opt/package.json 

# Install dependencies
WORKDIR /opt
RUN npm install

# Open Port 8080
EXPOSE 8080

# default task
CMD ["nodejs","/opt/hello.js"]
