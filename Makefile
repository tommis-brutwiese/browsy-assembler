PORT:=12000

.PHONY: help
help:   # This help
	@echo Available targets:
	@cat Makefile | grep -v PHONY | grep -E "^[a-zA-Z0-9]*:[\t ]*#" | sed "s/^\([a-zA-Z0-9]*:\).*#\(.*\)/  \1\t\2/"

.PHONY: web
web:    # Host the application locally
	cargo install wasm-pack
	wasm-pack build --target web
	python3 -m http.server $(PORT)

.PHONY: format
format: # Format the html-file
	tidy -m -i index.html
