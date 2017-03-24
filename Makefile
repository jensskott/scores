include build.props

.PHONY: all run build clean vet test package

APP_NAME=scores
APP_BUILD=`git log --pretty=format:'%h' -n 1`
GO_FLAGS= CGO_ENABLED=0
GO_LDFLAGS= -ldflags="-X main.AppVersion=$(APP_VERSION) -X main.AppName=$(APP_NAME) -X main.AppBuild=$(APP_BUILD)"
GO_BUILD_CMD=$(GO_FLAGS) go build $(GO_LDFLAGS)
BUILD_DIR=build
BINARY_NAME=$(APP_NAME)

all: clean build package

vet:
	@go vet `glide novendor`

test:
	@go test `glide novendor`

run:
	go run ./*.go $(RUN_ARGS)

build: vet test
	@mkdir -p $(BUILD_DIR)
	GOOS=linux GOARCH=amd64 $(GO_BUILD_CMD) -o $(BUILD_DIR)/$(BINARY_NAME)-linux-amd64

clean:
	rm -Rf $(BUILD_DIR)