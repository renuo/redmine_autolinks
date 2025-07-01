# frozen_string_literal: true

module RedmineAutolinks
  module WikiFormattingPatch
    AUTOLINK_PREFIX = /\b([A-Z_]{2,20})-([\dA-Z]+)/

    def to_html(format, text, options = {})
      return super unless options[:object].is_a?(Issue)

      autolinks = nil

      super.gsub(AUTOLINK_PREFIX) do |match|
        autolinks ||= Autolink.for_issue(options[:object])
        url = ERB::Util.html_escape(autolinks[Regexp.last_match[1]]&.sub("<ref>", Regexp.last_match[2]))

        url.blank? ? match : "<a href=\"#{url}\">#{match}</a>"
      end
    end
  end
end

Redmine::WikiFormatting.singleton_class.prepend RedmineAutolinks::WikiFormattingPatch
