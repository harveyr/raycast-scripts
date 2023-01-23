.PHONY: all
all: format lint

.PHONY: format
format:
	isort *.py
	black *.py

.PHONY: lint
lint: flake8 mypy

.PHONY: mypy
mypy:
	mypy *.py

.PHONY: flake8
flake8:
	flake8 *.py