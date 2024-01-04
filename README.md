# bin

## Installation

Clone this repository to a host where you want to use the scripts. Add the root directory to the environment variable `PATH`.

## Setting up the devlopment environment

### Install Bats
This repository employs [bats](https://github.com/bats-core/bats-core) as a testing framework for Bash scripts. bats core and libraries are included as submodules of this repository following [the quick installation guide](https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation). Run the following command to install the latest version of bats.
```
git submodule update --init --recursive
```

You may run unit tests manually by the following command.
```
./test/run_tests
```

However, those unit tests are usually run automatically by a pre-commit hook, which is introduced in the next subsection.

### Install pre-commit

This repository employs [pre-commit](https://pre-commit.com/) to manage pre-commit hooks. [Install pre-commit](https://pre-commit.com/#installation) if you have not installed it on a host where this repository is cloned. Then, run the following command to install hooks.
```
pre-commit install
```
You may confirm confirm if pre-comment works appropriately by running the command below.
```
pre-commit run --all-files
trim trailing whitespace........................................Passed
fix end of files................................................Passed
check yaml......................................................Passed
check for added large files.....................................Passed
ShellCheck......................................................Passed
Bats............................................................Passed
```
