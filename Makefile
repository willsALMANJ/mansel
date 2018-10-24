.DEFAULT_GOAL := all

all: lib cli

init:
	pipenv install --dev --skip-lock

lib:
	pipenv run python setup.py sdist bdist_wheel

cli:
	cd cli && pipenv run python setup.py sdist bdist_wheel

test:
	pipenv run pytest

release: release-lib release-cli

release-lib:
	pipenv run twine upload dist/*

release-cli:
	pipenv run twine upload cli/dist/*

clean:
	rm -rf build dist mansel.egg-info
	cd cli && rm -rf build dist mansel-cli.egg-info

.PHONY: all clean lib cli release release-lib release-cli
