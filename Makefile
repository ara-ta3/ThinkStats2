virtualenv=$(shell which virtualenv)
envdir=./env
requirements=./requirements.txt

all:init install

run:
	$(MAKE) __command command='IPYTHONDIR=./.jupyter jupyter notebook'

init:
	test -n $(virtualenv) && test -d $(envdir) || $(virtualenv) -p python3.5 $(envdir)

install:
	test -f $(requirements) && $(MAKE) __command command='pip install -r $(requirements)'

__command:
	env PATH=$(envdir)/bin:$(PATH) $(command)
