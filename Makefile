up:
	docker compose up -d
down:
	docker compose down
up-build:
	docker compose up --build -d
restart: down up-build
ssrf:
	curl "http://localhost:8000/load?url=http://www.google.com"
publish:
	# build the image as insecureapps/simple-ssrf
	docker build --platform linux/amd64 -t insecureapps/simple-ssrf:latest api
	# push the image to docker hub
	docker push insecureapps/simple-ssrf
	echo "View the latest image here: https://hub.docker.com/r/insecureapps/simple-ssrf"