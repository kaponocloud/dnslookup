include .env
NAME=dnslookup
BASE_BUILDDIR=build
BUILDNAME=$(GOOS)-$(GOARCH)
BUILDDIR=$(BASE_BUILDDIR)/$(BUILDNAME)
VERSION?=dev
CONTAINPATH=/go/src/github.com/kaponocloud/dnslookup
# CODEBASE=/Users/ysun/dev/dnslookup
CODEBASE=/home/ysun/dev/dnslookup

ifeq ($(GOOS),windows)
  ext=.exe
  archiveCmd=zip -9 -r $(NAME)-$(BUILDNAME)-$(VERSION).zip $(BUILDNAME)
else
  ext=
  archiveCmd=tar czpvf $(NAME)-$(BUILDNAME)-$(VERSION).tar.gz $(BUILDNAME)
endif

.PHONY: default
default: build

build: clean
	go build -ldflags "-X main.VersionString=$(VERSION)"

release: check-env-release
	mkdir -p $(BUILDDIR)
	cp LICENSE $(BUILDDIR)/
	cp README.md $(BUILDDIR)/
	CGO_ENABLED=0 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -ldflags "-X main.VersionString=$(VERSION)" -o $(BUILDDIR)/$(NAME)$(ext)
	cd $(BASE_BUILDDIR) ; $(archiveCmd)
docker:
	docker run --name golang -v $(CODEBASE):$(CONTAINPATH) -e GOOS=$(GOOS) -e GOARCH=$(GOARCH) --rm golang:1.14 sh -c \
	"cd $(CONTAINPATH) && make release"
dockerstop:
	docker stop golang && docker rm golang
docker4build:
	docker run --name golang -v $(CODEBASE):$(CONTAINPATH) -e GOOS=$(GOOS) -e GOARCH=$(GOARCH) --rm -d golang:1.14 sh -c \
	"tail -f /dev/null"
test:
	go test -race -v -bench=. ./...

clean:
	go clean
	rm -rf $(BASE_BUILDDIR)

check-env-release:
	@ if [ "$(GOOS)" = "" ]; then \
		echo "Environment variable GOOS not set"; \
		exit 1; \
	fi
	@ if [ "$(GOARCH)" = "" ]; then \
		echo "Environment variable GOOS not set"; \
		exit 1; \
	fi