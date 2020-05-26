#!/bin/bash

docker build . -t fabwice/docker-wot-wizard:v4.2.0 --build-arg WOT_WIZARD_VERSION=4.2.0 --no-cache
