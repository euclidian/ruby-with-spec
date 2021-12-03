PROJECT_ID := simple
SHELL := /bin/bash

default: web

build:
	@echo "-----------------------------------------------------------------"
	@echo "Copying Gemfile"
	@echo "-----------------------------------------------------------------"
	@rm -rf docker/Gemfile*
	@cp ../project/Gemfile* docker/
	@docker-compose -p $(PROJECT_ID) build web
	@docker-compose -p $(PROJECT_ID) build web_test

web: 
	@echo "------------------------------------------------------------------"
	@echo "Running Web"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) up -d web

migrate:
	@echo "------------------------------------------------------------------"
	@echo "Migrating"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) run web sh -c "rake db:create && rake db:schema:load"	

migrate_test:
	@echo "------------------------------------------------------------------"
	@echo "Migrating"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) run --rm web_test sh -c "export RACK_ENV=test && rake db:create && rake db:schema:load"	

web_test:
	@echo "------------------------------------------------------------------"
	@echo "Running Test"
	@echo "------------------------------------------------------------------"	
	@docker-compose -p $(PROJECT_ID) up -d web_test

test:
	@echo "------------------------------------------------------------------"
	@echo "Running Test"
	@echo "------------------------------------------------------------------"	
	@docker-compose -p $(PROJECT_ID) run --rm web_test sh -c "RACK_ENV=test bundle exec rspec"

lint:
	@echo "------------------------------------------------------------------"
	@echo "Running Test"
	@echo "------------------------------------------------------------------"	
	@docker-compose -p $(PROJECT_ID) run --rm web_test sh -c "RACK_ENV=test bundle exec rubocop"	

post_test:
	@echo "------------------------------------------------------------------"
	@echo "Cleaning Up Test"
	@echo "------------------------------------------------------------------"	
	@docker-compose -p $(PROJECT_ID) kill db_test
	@docker-compose -p $(PROJECT_ID) rm -f db_test


kill:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Killing in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) kill