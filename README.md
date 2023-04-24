Docker compose example:
```yaml
version: '2.1'
services:
  spacebar-server:
    image: ccgurley/spacebar-server:latest
    container_name: spacebar-server
    environment:
      CONFIG_PATH: '/spacebar-server/db/config.json'
    ports:
      - 3001:3001
    volumes:
      - <local directory>:/spacebar-server/db/
```

Database issues: try "npm run sync:db"
