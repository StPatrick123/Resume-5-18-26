SITE_URL ?= https://StPatrick123.github.io/Resume-5-18-26

.PHONY: all build dev clean install exports html

all: build

install:
	npm install

dev:
	npm run dev

html:
	npm run build:html

exports:
	SITE_URL=$(SITE_URL) ./scripts/build-exports.sh

build: html exports
	@echo ""
	@echo "Build complete. Open dist/index.html or serve with: npm run preview"

clean:
	rm -rf dist .astro
