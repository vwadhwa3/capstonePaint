setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.venv

install:
	# This should be run from inside a virtualenv
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
	chmod +x /bin/hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# # See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# # This is linter for Dockerfiles
	# /bin/hadolint Dockerfile
	./hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py
all: install lint test

