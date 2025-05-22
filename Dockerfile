# Use official Node.js LTS image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install --prod

# Copy source code
COPY . .

# Build the project
RUN pnpm build

# Expose the port your app runs on (default for express is 3000)
EXPOSE 3000

# Set environment variables (optional, can also be set in Cloud Run)
ENV NODE_ENV=production

# Start the app
CMD ["node", "dist/cli.js"]