# Hexa

A Redis service with Redis Commander for monitoring and management using Docker.

## Services

This project includes the following services:

- **Redis**: High-performance in-memory data structure store
- **Redis Commander**: Web-based Redis management tool

## Prerequisites

- Docker
- Docker Compose

## Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/tylerdgenius/hexa.git
   cd hexa
   ```

2. Start the services:
   ```bash
   docker-compose up -d
   ```

3. Access the services:
   - **Redis**: `localhost:6379`
   - **Redis Commander**: http://localhost:8081

## Service Details

### Redis
- **Image**: redis:7-alpine
- **Port**: 6379
- **Features**: 
  - Persistent storage with AOF (Append Only File)
  - Data volume for persistence
  - Alpine Linux base for smaller image size

### Redis Commander
- **Image**: rediscommander/redis-commander:latest
- **Port**: 8081
- **Default Credentials**: 
  - Username: `admin`
  - Password: `admin`
- **Features**:
  - Web-based Redis management interface
  - Real-time monitoring
  - Key-value browsing and editing

## Configuration

Copy the example environment file and customize as needed:

```bash
cp .env.example .env
```

### Available Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `REDIS_HOST` | Redis host | localhost |
| `REDIS_PORT` | Redis port | 6379 |
| `REDIS_COMMANDER_PORT` | Redis Commander port | 8081 |
| `REDIS_COMMANDER_USER` | Redis Commander username | admin |
| `REDIS_COMMANDER_PASSWORD` | Redis Commander password | admin |

## Docker Commands

### Start services
```bash
docker-compose up -d
```

### Stop services
```bash
docker-compose down
```

### View logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f redis
docker-compose logs -f redis-commander
```

### Restart services
```bash
docker-compose restart
```

### Remove everything (including volumes)
```bash
docker-compose down -v
```

## Redis CLI Access

Connect to Redis using the Redis CLI:

```bash
# Using Docker
docker exec -it hexa_redis redis-cli

# Using local Redis CLI (if installed)
redis-cli -h localhost -p 6379
```

## Data Persistence

Redis data is persisted using:
- Docker volume: `redis_data`
- AOF (Append Only File) for durability

## Security Notes

- Change the default Redis Commander credentials in production
- Consider adding Redis password authentication for production use
- Use proper network security groups/firewalls when deploying

## Troubleshooting

### Port Already in Use
If you encounter port conflicts, modify the port mappings in `docker-compose.yml`:

```yaml
ports:
  - "6380:6379"  # Redis
  - "8082:8081"  # Redis Commander
```

### Permission Issues
If you encounter permission issues with Docker, ensure your user is in the docker group:

```bash
sudo usermod -aG docker $USER
```

Then log out and back in.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the changes
5. Submit a pull request

## License

This project is open source and available under the [MIT License](LICENSE).