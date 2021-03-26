VERSION := 9.5

all: build push

build:
	docker build . -t topechelon/resourcespace:$(VERSION) --build-arg VERSION=$(VERSION)

push:
	docker push topechelon/resourcespace:$(VERSION)
