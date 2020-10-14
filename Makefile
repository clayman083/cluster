.PHONY:

install:
	python3 -m pip install ansible ansible-lint

lint:
	ansible-lint

clean:
	rm -rf dist

build: clean
	ansible-galaxy collection build --output-path dist

publish: build
	ansible-galaxy collection publish ./dist/*.tar.gz  --token $(GALAXY_TOKEN)
