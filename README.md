# Docker MariaDB on ARM arch

[![](https://images.microbadger.com/badges/image/turgon37/armhf-mariadb.svg)](https://microbadger.com/images/turgon37/armhf-mariadb "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/turgon37/armhf-mariadb.svg)](https://microbadger.com/images/turgon37/armhf-mariadb "Get your own version badge on microbadger.com")

This images contains an instance of mariadb runnable on arm devices such as Raspberry pi

GitHub repository [github.com/Turgon37/docker-armhf-mariadb](https://github.com/Turgon37/docker-armhf-mariadb)

## Docker Informations

* This image expose the following port

| Port           | Usage                    |
| -------------- | ------------------------ |
| 3306           | MariaDB applicative port |

* This image takes theses environnements variables as parameters

| Environment        | Usage           |
| -------------      | --------------- |

* The following volume is exposed by this image

| Volume         | Usage                          |
| -------------- | ------------------------------ |
| /var/lib/mysql | The database storage directory |

## Installation

* Manual (from an arm device)

```
git clone
docker build -t turgon37/amrhf-mariadb .
```

* or Automatic

```
docker pull turgon37/amrhf-mariadb
```


## Usage

```
docker run -p 3306:3306 turgon37/amrhf-mariadb
```
