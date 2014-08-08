build:
	docker build -t icecreammatt/dev .

shell:
	docker run -i -t icecreammatt/dev /bin/zsh
