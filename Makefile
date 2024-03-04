REQUIRED_BINS := go templ air npx
$(foreach bin,$(REQUIRED_BINS),\
    $(if $(shell command -v $(bin) 2> /dev/null),,$(error Please install `$(bin)`)))
	
$(shell cp -n .env.example .env)
include .env
export

all: air
.PHONY: all

test: 
	@go test -v ./...
.PHONY: test

air:
	@air
.PHONY: air

templ:
	@rm -f $$(which templ) && go install github.com/a-h/templ/cmd/templ@$$(go list -m github.com/a-h/templ | cut -d' ' -f2)
.PHONY: templ
