SHELL := /bin/bash

all: update install

install:
	ansible-playbook -vD -i playbooks/hosts playbooks/osx.yml

update:
	git pull
