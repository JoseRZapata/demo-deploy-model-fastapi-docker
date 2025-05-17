.PHONY: tests help init_env init_git pre-commit_update docs_view docs_test test check

####----Basic configurations----####

install_env: ## Install libs with UV and pre-commit
	@echo "🚀 Creating virtual environment using UV"
	uv sync --all-groups
	@echo "🚀 Installing pre-commit..."
	uv run pre-commit install
	@echo "💻 Activate virtual environment..."
	@bash -c "source .venv/bin/activate"

init_git: ## Initialize git repository
	@echo "🚀 Initializing local git repository..."
	git init -b main
	git add .
	git commit -m "🎉 Initial commit"
	@echo "🚀 Local Git already set!"

####----fastapi and docker----####
export PORT=5000
dev: ## Run FastAPI application
	@echo "🚀 Running FastAPI application"
	fastapi dev src/model_fastapi_deploy.py

dock-build: ## Build Docker image
	@echo "🚀 Building Docker image"
	docker build -t fastapi-docker:v1.0.0 .

dock-run: ## run Docker image
	@echo "🚀 Building Docker image"
	docker run -it -p $(PORT):5000 fastapi-docker:v1.0.0

api-ping: ## ping the api to check if it's running
	@echo "🚀 Testing FastAPI application"
	curl http://localhost:$(PORT)/

api-response: ## ping the api to check if it's running
	@echo "🚀 Testing FastAPI application"
	curl -X 'POST' \
  'http://localhost:$(PORT)/predict' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{"age": 50, "pclass": 2, "sex": "male", "sibsp": 0, "parch": 0, "fare": 30, "embarked": "C"}'

####----Tests----####
test: ## Test the code with pytest and coverage
	@echo "🚀 Testing code: Running pytest"
	@uv run pytest --cov

test_verbose: ## Test the code with pytest and coverage in verbose mode
	@echo "🚀 Testing code: Running pytest in verbose mode"
	@uv run pytest --no-header -v --cov

test_coverage: ## Test coverage report coverage.xml
	@echo "🚀 Testing code: Running pytest with coverage"
	@uv run pytest --cov --cov-report xml:coverage.xml

####----Pre-commit----####
pre-commit_update: ## Update pre-commit hooks
	@echo "🚀 Updating pre-commit hooks..."
	uv run pre-commit clean
	uv run pre-commit autoupdate

#

####----Clean----####
clean_env: ## Clean .venv virtual environment
	@echo "🚀 Cleaning the environment..."
	@[ -d .venv ] && rm -rf .venv || echo ".venv directory does not exist"

####----Git----####
switch_main: ## Switch to main branch and pull
	@echo "🚀 Switching to main branch..."
	@git switch main
	@git pull

clean_branchs: ## Clean local branches already merged on the remote
	@echo "🚀 Cleaning up merged branches..."
	@git fetch -p
	@for branch in $$(git for-each-ref --format '%(refname:short)' refs/heads/ | grep -v '^\*' | grep -v ' main$$'); do \
		if ! git show-ref --quiet refs/remotes/origin/$$branch; then \
			echo "Deleting local branch $$branch"; \
			git branch -D $$branch; \
		fi \
	done

####----Checks----####
check: ## Run code quality tools with pre-commit hooks.
	@echo "🚀 Linting, formating and Static type checking code: Running pre-commit"
	@uv run pre-commit run -a

lint: ## Run code quality tools with pre-commit hooks.
	@echo "🚀 Linting, formating and Static type checking code: Running pre-commit"
	@uv run pre-commit run ruff

####----Project----####
help:
	@printf "%-30s %s\n" "Target" "Description"
	@printf "%-30s %s\n" "-----------------------" "----------------------------------------------------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
