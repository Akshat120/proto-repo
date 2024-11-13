# Makefile for Go project
GO_MODULE := my-protobuf
BINARY_NAME := main
PROTOGEN := protogen
PROTO_BASIC := ./proto/basic
JOB := ./proto/job
SOFTWARE := ./proto/software

# Default target
all: clean generate deps run

# Generate binaries
build: ## Generate binaries
	go build -o $(BINARY_NAME) .

# Run the application
run: build ## Build and run the application
	./$(BINARY_NAME)

# Clean up binaries
clean: ## Remove generated protobufs
	rm -rf $(PROTOGEN)

# Format the code
generate: ## generate protobufs
	protoc --go_opt=module=$(GO_MODULE) --go_out=. $(PROTO_BASIC)/*.proto $(JOB)/*.proto $(SOFTWARE)/*.proto

# Install dependencies
deps: ## Install and tidy dependencies
	go mod tidy
	go mod vendor

# Show help
help: ## Show this help
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

.PHONY: all build clean run deps help
