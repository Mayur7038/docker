# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./


#docker build -t my-node-app .  to build 

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Expose the port the app runs on
EXPOSE 4343

# sudo docker run -p 4343:3000 testtwo   --->> to run docker images on port 4343 which is listening to 3000 in node application

# Define the command to run your app
CMD ["node", "app.js"]