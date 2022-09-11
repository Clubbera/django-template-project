up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

logs:
	docker-compose logs -f backend

createsuperuser:
	docker-compose exec backend python manage.py createsuperuser --username='admin' --email=''

backend:
	docker-compose exec backend /bin/bash

shell:
	docker-compose exec backend python manage.py shell

startapp: # make startapp app=APP_NAME
	docker-compose exec backend mkdir modules/$(app)
	docker-compose exec backend python manage.py startapp $(app) modules/$(app)
	sudo chmod -R 777 modules/$(app)
	mkdir modules/$(app)/models
	touch modules/$(app)/models/__init__.py
	touch modules/$(app)/serializers.py
	touch modules/$(app)/services.py
	touch modules/$(app)/urls.py

migrate:
	docker-compose exec backend python manage.py makemigrations
	docker-compose exec backend python manage.py migrate

permission:
	sudo chmod -R 777 .