#!/bin/bash

docker build . -t fabwice/docker-wot-wizard:v4.1.2 --build-arg WOT_WIZARD_VERSION=4.1.2 --no-cache
