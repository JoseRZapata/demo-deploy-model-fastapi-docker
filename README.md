# Demo deploy model fastapi docker

[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/charliermarsh/ruff/main/assets/badge/v2.json)](https://github.com/charliermarsh/ruff)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![security: bandit](https://img.shields.io/badge/security-bandit-yellow.svg)](https://github.com/PyCQA/bandit)
[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](https://mypy-lang.org/)

## ✨ Features

### FastAPI run locally

Run fastapi app: `fastapi dev src/model_fastapi_deploy.py`

### Run Docker

Build the docker image: `docker build -t fastapi-docker:v0.0.1 .`
Run the docker container: `docker run -p 5000:5000 fastapi-docker:v0.0.1`

Docs will be available at `http://localhost:5000/docs`

## 🗃️ Project structure

- [Data structure]
ence-project-template/#features-and-tools>- [Pipelines based on Feature/Training/Inference Pipelines](https://www.hopsworks.ai/post/mlops-to-ml-systems-with-fti-pipelines)

```bash
.
├── codecov.yml                         # configuration for codecov
├── .code_quality
│   ├── mypy.ini                        # mypy configuration
│   └── ruff.toml                       # ruff configuration
├── .editorconfig                       # editor configuration
├── .github                             # github configuration
│   ├── dependabot.md                   # github action to update dependencies
│   ├── pull_request_template.md        # template for pull requests
│   └── workflows                       # github actions workflows
│       ├── ci.yml                      # run continuous integration (tests, pre-commit, etc.)
│       ├── dependency_review.yml       # review dependencies
│       ├── docs.yml                    # build documentation (mkdocs)
│       └── pre-commit_autoupdate.yml   # update pre-commit hooks
├── .gitignore                          # files to ignore in git
├── Makefile                            # useful commands to setup environment, run tests, etc.
├── .pre-commit-config.yaml             # configuration for pre-commit hooks
├── pyproject.toml                      # dependencies for the python project
├── README.md                           # description of your project
├── src                                 # source code for use in this project
│   ├── README.md                       # description of src structure
predictions
├── tests                               # test code for your project
│   ├── test_mock.py                    # example test file
└── .vscode                             # vscode configuration
    ├── extensions.json                 # list of recommended extensions
    ├── launch.json                     # vscode launch configuration
    └── settings.json                   # vscode settings
```

## References

- [FastAPI documentation](https://fastapi.tiangolo.com/)
- [Deploying Machine Learning Models with FastAPI and Docker: A Step-by-Step Guide]<https://medium.com/@gvgg1998/deploying-machine-learning-models-with-fastapi-and-docker-a-step-by-step-guide-5e35b984f792>
- <https://github.com/Paulescu/kubernetes-for-ml-engineers>

## Credits

This project was generated from [@JoseRZapata]'s [data science project template] template.

---
[@JoseRZapata]: https://github.com/JoseRZapata

[data science project template]: https://github.com/JoseRZapata/data-science-project-template
[Data structure]: https://github.com/JoseRZapata/data-science-project-template/blob/main/demo-deploy-model-fastapi-docker/data/README.md
