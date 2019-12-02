

help: ## Show help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build docker image
	docker build \
		-t thaim/sample-unicorn-worker-killer \
		.

run:
	docker run -it --rm -p 3000:3000 \
		thaim/sample-unicorn-worker-killer
