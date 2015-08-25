

PWD = $(shell pwd)

FLUENTD_IMAGE          ?= liquidweb/fluentd
FLUENTD_VERSION        ?= buildtest

all: default

default:
	${MAKE} pull
	${MAKE} build

pull:
	docker pull kiyoto/docker-fluentd:latest

delete:
	docker rmi ${FLUENTD_IMAGE}:${FLUENTD_VERSION}

build:
	docker build --tag="${FLUENTD_IMAGE}:${FLUENTD_VERSION}" .

run:
	docker run -d -v /var/lib/docker/containers:/var/lib/docker/containers ${FLUENTD_IMAGE}:${FLUENTD_VERSION}

