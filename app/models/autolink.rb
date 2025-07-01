# frozen_string_literal: true

class Autolink < ApplicationRecord
  belongs_to :project

  validates :prefix, presence: true, length: { in: 2..20 },
                     format: { with: /\A[A-Z_]+\z/ }
  validates :target_url, presence: true, length: { maximum: 255 },
                         format: { with: %r{\Ahttps?://.+<ref>.*\z} }

  class << self
    def for_issue(issue)
      where(project_id: issue.project_id).pluck(:prefix, :target_url).to_h
    end
  end
end
