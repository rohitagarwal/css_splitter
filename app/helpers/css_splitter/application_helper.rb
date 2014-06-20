module CssSplitter
  module ApplicationHelper
    def split_stylesheet_link_tag(*sources)
      options     = sources.extract_options!
      split_count = options.delete(:split_count) || 2

      sources.map do |source|
        split_sources = (2..split_count).map { |index| "#{source}_split#{index}" }
        split_sources << options

        [
          stylesheet_link_tag(source, options),
          stylesheet_link_tag(*split_sources),
        ]
      end.flatten.join("\n").html_safe
    end
  end
end
