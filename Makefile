SHELL := /bin/bash

basecmd = ansible-playbook -vD -i
hosts = playbooks/hosts
playbook = playbooks/osx.yml

all: update install

install:
	${basecmd} ${hosts} ${playbook}

update:
	git pull

home:
	${basecmd} ${hosts} --tags=homedir ${playbook}
