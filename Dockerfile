# Use the official Node.js runtime as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies and nodemon globally for hot reload in development
RUN npm install && npm install -g nodemon

# Copy the rest of the application code
COPY . .

# Create a non-root user for security and change ownership
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001 && \
    chown -R nextjs:nodejs /app
USER nextjs

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application with nodemon for hot reload
CMD ["npm", "run", "dev"]
