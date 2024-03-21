build-container:
	$(MAKE) -C ./projects/$(project)/container build

remove-containers:
	docker stop $(project) anvil-node && docker rm $(project) anvil-node || true

build-multiplatform:
	$(MAKE) -C ./projects/$(project)/container build-multiplatform

deploy-container:
	$(MAKE) remove-containers
	cp ./projects/$(project)/container/config.json deploy/config.json
	cd deploy && docker-compose up

deploy-contracts:
	$(MAKE) -C ./projects/$(project)/contracts deploy

call-contract:
	$(MAKE) -C ./projects/$(project)/contracts call-contract

build-service:
	$(MAKE) -C ./projects/$(project)/$(service) build

run-service:
	$(MAKE) -C ./projects/$(project)/$(service) run
