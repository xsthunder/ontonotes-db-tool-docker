# ontonotes db tool docker

One command to run ontonotes with docker! use ontotool with mysql5.0 without pain.

## feature

1. database initial is done for you in [`db-tool/load-data.sh`](db-tool/load-data.sh).
2. persist mysql data with docker volume. see [`docker-compose.yml` db-data](docker-compose.yml) for detail.
3. python2 env with Mysql-python is provided for quick start. see [login into ontonotes db-tool for manipulating onto-db](#login-into-ontonotes-db-tool-for-manipulating-onto-db) for detail.

## prepare

you need to put ontonotes-release-5.0 directory to this repo as following. you can find `ontonotes-release-5.0` on [OntoNotes Release 5.0 - Linguistic Data Consortium](https://catalog.ldc.upenn.edu/LDC2013T19)

```txt
.
|-- README.sh
|-- conda.sh
|-- db-tool
|   |-- Dockerfile
|   |-- load-data.sh
|   `-- wait-for
|-- docker-compose.yml
|-- ontonotes-release-5.0 // prepare this directory
|   |-- data
|   |   |-- database
|   |   `-- files
|   |-- docs
|   |   |-- OntoNotes-Release-5.0.pdf
|   |   |-- README
|   |   |-- file.tbl
|   |   |-- guidelines
|   |   `-- ontonotes-named-entity-guidelines-v14.pdf
|   |-- index.html
|   `-- tools
|       `-- ontonotes-db-tool-v0.999b
`-- static-server
    `-- Dockerfile`
```

## run

```
cd <this_repo>
docker-compose up
```

static web of `ontonotes-release-5.0 ` are hosted on http://0.0.0.0:3222 or http://docker-machine:3222 (map `docker-machine` to ip at your hosts first).

## login into ontonotes db-tool for manipulating onto-db

see http://0.0.0.0:3222/tools/ontonotes-db-tool-v0.999b/doc/html/ or  http://docker-machine:3222/tools/ontonotes-db-tool-v0.999b/doc/html/ (map `docker-machine` to ip at your hosts first) for tool doc. refer to [db-tool/load-data.sh](db-tool/load-data.sh) for my_db, my_server, my_name, and onto-repo setting.

```
docker exec -it ontonotes-db-tool-docker_tool_1 sh
cd tool
```

## use host python2 instead of db-tool

[`conda.sh`](conda.sh) is provided to create a db-tool env for host machine by anaconda. [Anaconda | The World's Most Popular Data Science Platform](https://www.anaconda.com/)

in this case, you need to expose the db service's 3306 port to the host. see [docker-compose.yml](docker-compose.yml) for detail.

no initial of onto mysql database is needed, since those steps are done by db-tool. see [db-tool/load-data.sh](db-tool/load-data.sh) for detail.

## login to db

`onto_db` is our db. see [`docker-compose.yml` service db environment ](docker-compose.yml) for detail.

```
docker exec -it ontonotes-db-tool-docker_db_1 mysql
show databases;
use onto_db;
```

## ref

[Compose file version 3 reference](https://docs.docker.com/compose/compose-file/#depends_on)

### wait-for

- [eficode/wait-for: ./wait-for is a script to wait for another service to become available.](https://github.com/eficode/wait-for)
- [Control startup and shutdown order in Compose | Docker Documentation](https://docs.docker.com/compose/startup-order/)
