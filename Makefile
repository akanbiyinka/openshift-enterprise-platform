IMAGE=openshift-app

build:
	docker build -t $(IMAGE) app

run:
	docker run -p 8080:8080 $(IMAGE)

compose:
	docker compose up --build -d

stop:
	docker compose down

test:
	cd app && pytest

clean:
	docker system prune -f