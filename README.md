# python-dev – Dockerized Python Development Environment

## Introduction

This repository is a lightweight template for a reproducible Python development environment using Docker and VS Code Dev Containers. It is pre-configured to optionally leverage an NVIDIA GPU when available, so you can work on data science, ML, or general Python projects without polluting your host system.

## Prerequisite

Before using this repository, you need to have the following installed on your system:

- Docker Desktop
- VSCode with Dev Container extension installed
- Alternative: Remote Repositories extension of VSCode

## How to use

To use this repository, follow the steps below:

1. Create new repository by clicking the Use this template button above.
2. Open your duplicated repository in VSCode using the command ">Dev Containers: Clone Repositories in Named Container Volume". You can name your container for easy referencing.

## mise and py-init

This devcontainer uses "mise" (a small environment/tool manager) and a convenience shell helper named `py-init` to quickly create a mise-managed Python environment and a project virtualenv.

Quick usage
- Open a new shell and cd into your project directory.
- Run:
  - py-init 3.11
  - or any supported version (e.g. py-init 3.10, py-init 3.13)

What py-init does
- Creates/updates a local mise.toml in the current directory.
- Uses mise to select the requested Python version.
- Configures the local virtualenv path to .venv and enables automatic creation.
