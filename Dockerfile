# Use LTS Node.js alpine image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install build dependencies for sqlite3 native compilation if needed
RUN apk add --no-cache python3 make g++

# Copy package descriptors
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy application code
COPY . .

# Expose standard application port
EXPOSE 3000

# Set environment defaults
ENV PORT=3000
ENV NODE_ENV=production

# Start application
CMD ["npm", "start"]

