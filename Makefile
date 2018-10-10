DOCKER_TAG=lukd/taskwarrior

.PHONY: build

build:
	docker build --tag $(DOCKER_TAG) .
