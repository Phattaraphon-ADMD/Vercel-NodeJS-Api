# Node.js API with Docker - Hot Reload Development

A modern Node.js REST API built with Express.js and Docker, featuring hot reload capabilities for efficient development.

## 🚀 Features

- **Express.js** - Fast, unopinionated web framework
- **Docker** - Containerized development and deployment
- **Hot Reload** - Automatic server restart on code changes using nodemon
- **Security** - Helmet.js for security headers
- **CORS** - Cross-Origin Resource Sharing enabled
- **Logging** - Morgan for HTTP request logging
- **Health Check** - Built-in health check endpoint
- **Development-Ready** - Optimized for development workflow

## 📁 Project Structure

```
nodejs-docker-api/
├── src/
│   └── index.js          # Main application file
├── package.json          # Node.js dependencies and scripts
├── Dockerfile           # Docker image configuration
├── docker-compose.yml   # Docker Compose configuration
├── nodemon.json         # Nodemon configuration for hot reload
├── .gitignore          # Git ignore rules
├── .dockerignore       # Docker ignore rules
└── README.md           # This file
```

## 🛠️ Prerequisites

- **Node.js** (v18 or higher)
- **Docker** and **Docker Compose**
- **npm** or **yarn**

## 🏃‍♂️ Quick Start

### Option 1: Run with Docker (Recommended for Development)

1. **Clone or navigate to the project directory:**
   ```bash
   cd c:/Test-env/NodejsDocker
   ```

2. **Start the development environment:**
   ```bash
   npm run docker:dev
   ```

3. **Access the API:**
   - Main endpoint: http://localhost:3000
   - Health check: http://localhost:3000/api/health
   - Users endpoint: http://localhost:3000/api/users

4. **Stop the development environment:**
   ```bash
   npm run docker:stop
   ```

### Option 2: Run Locally (Node.js Required)

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Start development server:**
   ```bash
   npm run dev
   ```

3. **Or start production server:**
   ```bash
   npm start
   ```

## 📋 Available Scripts

| Script | Description |
|--------|-------------|
| `npm start` | Start the production server |
| `npm run dev` | Start development server with hot reload |
| `npm run docker:build` | Build Docker image |
| `npm run docker:run` | Run Docker container |
| `npm run docker:dev` | Start development with Docker Compose |
| `npm run docker:dev:detached` | Start development in background |
| `npm run docker:stop` | Stop Docker Compose services |

## 🔌 API Endpoints

### Base Endpoints

- **GET /** - Welcome message with server info
- **GET /api/health** - Health check endpoint

### User Endpoints

- **GET /api/users** - Get all users (sample data)
- **POST /api/users** - Create a new user

#### Example POST request:
```json
{
  "name": "John Doe",
  "email": "john@example.com"
}
```

## 🐳 Docker Configuration

### Development Features

- **Hot Reload**: Code changes trigger automatic server restart
- **Volume Mounting**: Local code is mounted into the container
- **Port Mapping**: Container port 3000 mapped to host port 3000
- **Health Check**: Automatic health monitoring
- **Security**: Non-root user for container security

### Environment Variables

- `NODE_ENV`: Set to 'development' in docker-compose
- `PORT`: Server port (default: 3000)

## 🔧 Development Workflow

1. **Make code changes** in the `src/` directory
2. **nodemon** automatically detects changes
3. **Server restarts** automatically
4. **Test your changes** at http://localhost:3000

### Hot Reload Configuration

The hot reload is configured through:
- **nodemon.json**: Watches `src/` directory for `.js` and `.json` files
- **Docker volumes**: Mounts local code into container
- **npm script**: Uses `nodemon` instead of `node`

## 🔒 Security Features

- **Helmet.js**: Sets various HTTP headers for security
- **CORS**: Configured for cross-origin requests
- **Input validation**: Basic validation on POST endpoints
- **Non-root user**: Docker container runs as non-root user

## 🧪 Testing the API

### Using curl:

```bash
# Health check
curl http://localhost:3000/api/health

# Get users
curl http://localhost:3000/api/users

# Create user
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com"}'
```

### Using a REST client:
Import the following endpoints into Postman, Insomnia, or similar:
- GET http://localhost:3000/
- GET http://localhost:3000/api/health
- GET http://localhost:3000/api/users
- POST http://localhost:3000/api/users

## 🐛 Troubleshooting

### Common Issues:

1. **Port already in use:**
   ```bash
   # Check what's using port 3000
   netstat -ano | findstr :3000
   # Kill the process or change the port in docker-compose.yml
   ```

2. **Docker permission issues:**
   ```bash
   # Ensure Docker Desktop is running
   # Try running commands as administrator if needed
   ```

3. **Hot reload not working:**
   - Ensure volumes are properly mounted in docker-compose.yml
   - Check nodemon.json configuration
   - Verify file changes are being detected

4. **Container won't start:**
   ```bash
   # Check logs
   docker-compose logs nodejs-api
   ```

## 🔄 Next Steps

Consider adding:
- **Database integration** (MongoDB, PostgreSQL)
- **Authentication** (JWT tokens)
- **API documentation** (Swagger/OpenAPI)
- **Testing** (Jest, Supertest)
- **Linting** (ESLint, Prettier)
- **Environment configuration** (.env files)
- **Production Dockerfile** (multi-stage build)

## 📝 License

MIT License - feel free to use this project for learning and development!

---

Happy coding! 🎉
