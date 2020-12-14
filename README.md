# ontonotes-docker

One command to run ontonotes with docker!

## feature

1. use ontotool with mysql5.0 without pain!
2. database initial is done for you in [db-tool/load-data.sh](db-tool/load-data.sh)
3. persist data with docker volume. see [docker-compose.yml](docker-compose.yml) for detail

## prepare

you need to put ontonotes-release-5.0 directory to this repo as following. you can find `ontonotes-release-5.0` on [OntoNotes Release 5.0 - Linguistic Data Consortium](https://catalog.ldc.upenn.edu/LDC2013T19)

```txt
.
|-- README.sh
|-- db-tool
|   |-- Dockerfile
|   |-- load-data.sh
|   `-- wait-for
|-- docker-compose.yml
|-- ontonotes-release-5.0 // prepare this directory
|   |-- conda.sh
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

static web are hosted on `http://0.0.0.0:3222`

## login into ontonotes db tool env

```
docker exec -it ontonotes-db-tool-docker_tool sh
```

## ref

[Compose file version 3 reference](https://docs.docker.com/compose/compose-file/#depends_on)

wait-for
----------
[eficode/wait-for: ./wait-for is a script to wait for another service to become available.](https://github.com/eficode/wait-for)
[Control startup and shutdown order in Compose | Docker Documentation](https://docs.docker.com/compose/startup-order/)
