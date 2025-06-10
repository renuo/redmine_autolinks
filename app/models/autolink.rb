# frozen_string_literal: true

class Autolink < ApplicationRecord
  belongs_to :project

  validates :prefix, presence: true, length: { in: 2..20 },
                     format: { with: /\A[A-Z_]+\z/ }
  validates :target_url, presence: true, length: { maximum: 255 },
                         format: { with: %r{\Ahttps?://.+<num>.*\z} }

  def target_url_with(num)
    target_url.sub("<num>", num)
  end
end
