# frozen_string_literal: true

Redmine::Plugin.register :redmine_autolinks do
  name "Autolinks"
  author "hunchr"
  description "Create custom references to external tickets."
  version "0.1.0"
  url "https://github.com/renuo/redmine_autolinks"
  author_url "https://github.com/renuo"

  permission :manage_autolinks, { autolinks: %i[new edit create update destroy] }, require: :loggedin
end

require_relative "lib/redmine_autolinks/project_patch"
require_relative "lib/redmine_autolinks/projects_helper_patch"
require_relative "lib/redmine_autolinks/wiki_formatting_patch"
