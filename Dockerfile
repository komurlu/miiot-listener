# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Expose the port your app will listen on (default is 9898 in your script)
EXPOSE 9898

# Command to run your application
CMD [ "node", "index.js" ]
