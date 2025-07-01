# frozen_string_literal: true

module RedmineAutolinks
  module ProjectsHelper
    def self.included(base)
      base.class_eval do
        alias_method :project_settings_tabs_without_autolinks, :project_settings_tabs
        alias_method :project_settings_tabs, :project_settings_tabs_with_autolinks
      end
    end

    def project_settings_tabs_with_autolinks
      project_settings_tabs_without_autolinks << {
        name: :autolinks, action: :manage_autolinks,
        partial: "projects/settings/autolinks", label: :autolinks_title_index
      }
    end
  end
end

ProjectsHelper.include RedmineAutolinks::ProjectsHelper
