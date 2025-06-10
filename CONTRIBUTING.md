# Contributing Guide

## Prerequisites

- Ruby
- SQLite

## Local Setup

```sh
git clone --single-branch -b 6.0-stable https://github.com/redmine/redmine
cd redmine
git clone https://github.com/renuo/redmine_autolinks plugins/redmine_autolinks
cd plugins/redmine_autolinks

bin/setup
```

## Development

- Run: `bin/run`
- Lint: `bin/fastcheck`
