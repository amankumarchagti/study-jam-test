ENV_NAME=oauth-env
BIN=$(ENV_NAME)/bin/
PYTHON=/usr/bin/python3
BASE_REQUIREMENTS=requirements/requirements-base.in
DEV_REQUIREMENTS=requirements/requirements-dev.in

create_environment:
	$(PYTHON) -m venv $(ENV_NAME)
	. $(ENV_NAME)/bin/activate

clean:
	rm -rf $(ENV_NAME)
	find . -type f -name '*.pyc' -delete
	rm -rf __pycache__

install_requirements:
	$(BIN)python -m pip config set global.trusted-host=pypi.org files.pythonhosted.org
	$(BIN)pip install -r $(BASE_REQUIREMENTS)

install_dev_requirements: install_requirements
	$(BIN)python -m pip config set global.trusted-host=pypi.org files.pythonhosted.org
	$(BIN)pip install -r $(DEV_REQUIREMENTS)

# Run unittests and generate html coverage report
test:
	coverage run --source=./src -m pytest tests
	coverage html

# Run linters check only
lint:
	$(BIN)isort . --check
	$(BIN)black . --check

# Run linters and try to fix the errors
format:
	$(BIN)isort .
	$(BIN)black .

# Update all libraries required to run this application
requirements_txt:
	sort -u $(BASE_REQUIREMENTS) -o $(BASE_REQUIREMENTS)
	pip-compile --output-file=requirements.txt $(BASE_REQUIREMENTS)

requirements_dev_txt:
	sort -u $(DEV_REQUIREMENTS) -o $(DEV_REQUIREMENTS)
	sort -u $(BASE_REQUIREMENTS) -o $(BASE_REQUIREMENTS)
	pip-compile --output-file=requirements.txt $(BASE_REQUIREMENTS) $(DEV_REQUIREMENTS)

# Re/install the virtual environment with all requirements
install:
	make clean
	make create_environment
	make install_requirements

# Re/install the virtual environment for DEV usage
dev_install:
	make clean
	make create_environment
	make install_dev_requirements

# Do all checks.
build:
	dev_install lint test
