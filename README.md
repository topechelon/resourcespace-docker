**Simplified Docker Container for Resourcespace**

***Repurposed for TES***

# ResourceSpace Docker Container
ResourceSpace running on Alpine  with Nginx

## Requirements
- Mysql or MariaDB 

## ENVs to be passed:
```
DB_HOST
DB_USER
DB_NAME
BASE_URL
SYSTEM_EMAIL
DB_PASSWORD
SPIDER_PASSWORD
SCRAMBLE_KEY
```

## Example usage:
```
RESOURCESPACE_VERSION=9.0
docker run -p 80:80 --build-arg VERSION=${RESOURCESPACE_VERSION} topechelon/resourcespace-docker:${RESOURCESPACE_VERSION}
```

