IMAGE_REPO=gambitlabs/php
IMAGE_VERSION=v0.5.0

build: build-php5 build-php7
build-php5:
	docker build -t $(IMAGE_REPO):5.6-$(IMAGE_VERSION) -f Dockerfile.php5 .
	docker tag $(IMAGE_REPO):5.6-$(IMAGE_VERSION) $(IMAGE_REPO):5

build-php7:
	docker build -t $(IMAGE_REPO):7.0-$(IMAGE_VERSION) .
	docker tag $(IMAGE_REPO):7.0-$(IMAGE_VERSION) $(IMAGE_REPO):7
	docker tag $(IMAGE_REPO):7 $(IMAGE_REPO)

push: build
	docker push $(IMAGE_REPO):5.6-$(IMAGE_VERSION)
	docker push $(IMAGE_REPO):5-$(IMAGE_VERSION)
	docker push $(IMAGE_REPO):7.0-$(IMAGE_VERSION)
	docker push $(IMAGE_REPO):7
	docker push $(IMAGE_REPO)
	