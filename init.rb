# frozen_string_literal: true

Redmine::Plugin.register :redmine_autolinks do
  name "Autolinks"
  author "hunchr"
  description "Create custom references to external tickets."
  version "0.1.0"
  url "https://github.com/renuo/redmine_autolinks"
  author_url "https://github.com/renuo"

  permission :autolinks, { autolinks: %i[index show new edit create update destroy] },
             require: :loggedin

  menu :project_menu, :autolinks, { controller: :autolinks, action: :index },
       caption: "Autolinks", after: :activity, param: :project_id
end
