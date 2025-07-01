# frozen_string_literal: true

module RedmineAutolinks
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        has_many :autolinks, dependent: :delete_all
      end
    end
  end
end

Project.include RedmineAutolinks::ProjectPatch
