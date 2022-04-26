# frozen_string_literal: true

require_relative "gen/dataset"
require_relative "gen/document"
require_relative "gen/run"
require_relative "gen/target"
require_relative "gen/template"
require_relative "gen/version"

module Code
  # This module generates a t&c document for a given dataset and template.
  module Gen
    class Error < StandardError; end

    def self.settings
      @settings ||= OpenStruct.new(
        target_folder_path: nil,
        target_filename: nil,
        dataset_path: nil,
        template_path: nil,
        section_join_character: nil
      )
    end

    def self.setup
      yield(settings)
    end
  end
end
