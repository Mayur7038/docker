# docker

To create a Docker image with an Express project, you'll need to follow these steps:

1. Set up your Express project:
   - Create a new directory for your project: `mkdir express-project`
   - Navigate into the project directory: `cd express-project`
   - Initialize a new Node.js project: `npm init`
   - Install Express: `npm install express`

2. Create an Express application:
   - Create an `index.js` file in the project directory.
   - Open the `index.js` file in a text editor and add the following code:
     ```javascript
     const express = require('express');
     const app = express();

     app.get('/', (req, res) => {
       res.send('Hello, Express!');
     });

     app.listen(3000, () => {
       console.log('Server started on port 3000');
     });
     ```

3. Create a Dockerfile:
   - In the project directory, create a new file called `Dockerfile`.
   - Open the `Dockerfile` in a text editor and add the following content:
     ```
     # Use the official Node.js image as the base
     FROM node:14

     # Set the working directory inside the container
     WORKDIR /app

     # Copy package.json and package-lock.json to the working directory
     COPY package*.json ./

     # Install project dependencies
     RUN npm install

     # Copy the rest of the application code
     COPY . .

     # Expose the port on which your Express app is listening
     EXPOSE 3000

     # Start the Express application
     CMD ["node", "index.js"]
     ```

4. Build the Docker image:
   - Open a terminal or command prompt in the project directory.
   - Run the following command to build the Docker image:
     ```
     docker build -t express-app .
     ```
     This command builds the Docker image and tags it as `express-app`.

5. Run the Docker container:
   - Once the image is built, you can run the container using the following command:
     ```
     docker run -p 3000:3000 express-app
     ```
     This command maps port 3000 of the container to port 3000 of your host machine.

That's it! You now have a Docker image containing your Express project, and you're running it in a Docker container. You can access your Express application by opening a web browser and navigating to `http://localhost:3000`.



6. push docker image to hub


docker login


docker tag local_image:tag your_dockerhub_username/repository_name:tag
e.g :-  docker tag express-one:latest mayur2/express-one:latest

docker push your_dockerhub_username/repository_name:tag
e.g :-  docker push mayur2/express-one:latest
