virtualenv=$(shell which virtualenv)
envdir=./env
requirements=./requirements.txt
jupyter=$(envdir)/bin/jupyter


all:init install

run:
	$(MAKE) __command command='IPYTHONDIR=./.jupyter jupyter notebook'

init:
	test -n $(virtualenv) && test -d $(envdir) || $(virtualenv) -p python3.5 $(envdir)

install:
	test -f $(requirements) && $(MAKE) __command command='pip install -r $(requirements)'

__command:
	env PATH=$(envdir)/bin:$(PATH) $(command)

install-vim-plugin: __install-vim-plugin .jupyter/custom/custom.js

__install-vim-plugin:
	test -f $(jupyter)
	mkdir -p `$(jupyter) --data-dir`/nbextensions
	test -d `$(jupyter) --data-dir`/nbextensions/vim_binding || git clone https://github.com/lambdalisue/jupyter-vim-binding.git `$(jupyter) --data-dir`/nbextensions/vim_binding
	$(MAKE) __command command='jupyter nbextension enable vim_binding/vim_binding'

.jupyter/custom/custom.js:
	cp -f customfiles/custom.js $@
