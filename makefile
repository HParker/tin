HOST?=0.0.0.0
PORT?=9393

default: help

c: console
s: server
t: test

console:
	@irb -r ./app.rb -r ./cli.rb

db-seed:
	@ruby -r ./app.rb ./db/seeds.rb

help:
	@cat ./docs/help

install: init update

init:
	@cp -n .env.example .env
	@gem install bundler

secret:
	@ruby -r securerandom -e "puts SecureRandom.hex(64)"

server:
	@./bin/shotgun -s puma -o $(HOST) -p $(PORT)

smtp:
	@./bin/mt 2525

test:
	@rspec

update:
	@bundle install
