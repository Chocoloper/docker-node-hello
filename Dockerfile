FROM ubuntu:trusty

# Update & Intall Node.js, Npm 
RUN sudo apt-get update \
	&& sudo apt-get install -y \
	npm \
	nodejs
	&& sudo npm install -g npm

# Copy App
COPY ./src /src
# Install dependencies
RUN cd /src; npm install

# Open Port 8080
EXPOSE 8080
CMD ["node","/src/hello.js"]
