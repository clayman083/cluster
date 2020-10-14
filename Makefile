.PHONY:

install:
	python3 -m pip install ansible==2.10.0 ansible-lint==4.3.5

lint:
	ansible-lint

clean:
	rm -rf dist

build: clean
	ansible-galaxy collection build --output-path dist

publish: build
	ansible-galaxy collection publish ./dist/*.tar.gz  --token $(GALAXY_TOKEN)
