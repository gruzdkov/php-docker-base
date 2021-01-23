#!/bin/sh
docker-compose down -v;
docker-compose stop;
rm -rf ./data;
rm -rf ./tmp;
docker-compose rm -fv;
