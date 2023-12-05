# Use the base image with Node.js pre-installed
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /src

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the entire codebase to the working directory
COPY . .

# Build the production-ready bundle using Parcel
RUN npm run build

# Install xdg-utils and a lightweight browser (chromium)
RUN apk add --no-cache xdg-utils chromium

# Expose the desired port (change it if necessary)
EXPOSE 1234

# Start the application
CMD ["sh", "-c", "npm start & sleep 5 && xdg-open http://localhost:1234"]
