# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY ionic.config.json ./
COPY package*.json ./

# Install dependencies
RUN npm install -g ionic
RUN npm install

#copy folder content
COPY ./ ./

#use nginx iamge
FROM nginx:alpine

#delete content of html directory
RUN rm -rf /usr/share/nginx/html/*


#build app

RUN npm run build

#copy content of www directory
COPY ./www/ /usr/share/nginx/html/