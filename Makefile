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

install-vim-plugin:
	test -f $(envdir)/bin/jupyter
	mkdir -p `$(envdir)/bin/jupyter --data-dir`/nbextensions
	git clone https://github.com/lambdalisue/jupyter-vim-binding.git `$(envdir)/bin/jupyter --data-dir`/nbextensions/vim_binding
