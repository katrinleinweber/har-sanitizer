CONTAINER := har-sanitizer
IMAGE_TAG := $(CONTAINER):latest

all:
	docker build --tag $(IMAGE_TAG) . && \
	docker run --rm --detach -p 8080:8080 \
		 --name=$(CONTAINER) $(IMAGE_TAG) && \
	sleep 002 && open http://localhost:8080/

clean:
	docker remove --force $(CONTAINER)

test:
	docker run --rm -v ${PWD}/Makefile:/Makefile mrtazz/checkmake
	docker run --rm -v ${PWD}:/app aquasec/trivy fs --quiet /app

.PHONY:	all clean test
