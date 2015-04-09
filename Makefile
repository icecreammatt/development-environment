build:
	docker build -t icecreammatt/devenv .

shell:
	docker run -i -t icecreammatt/devenv /bin/zsh
