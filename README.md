# Redmine Autolinks

Create custom references to external tickets.

## Usage

### Setup

```sh
git clone https://github.com/renuo/redmine_autolinks plugins/redmine_autolinks

RAILS_ENV=production NAME=redmine_autolinks bin/rails redmine:plugins:migrate
```

### Configuration

Autolinks can be created on the settings page of a project:

<img src=https://github.com/user-attachments/assets/015f3e91-bff1-4391-8ab1-0fed71e3c55c width=550><br>

This will link all the references in this project's issue descriptions to the specified URL:

<img src=https://github.com/user-attachments/assets/95804b9f-d98d-458d-aafa-3050504eeaa2 width=550>

## Contributing

See [Contributing Guide](https://github.com/renuo/redmine_autolinks/blob/main/CONTRIBUTING.md).

## License

Copyright 2025-present [Renuo AG](https://www.renuo.ch),
published under the [MIT License](https://github.com/renuo/redmine_autolinks/blob/main/LICENSE).
