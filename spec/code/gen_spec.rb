# frozen_string_literal: true

RSpec.describe Code::Gen do
  let(:file_path) { Code::Gen.settings.target_folder_path + Code::Gen.settings.target_filename }

  before do
    Code::Gen.setup do |settings|
      settings.target_folder_path     =  "examples/"
      settings.target_filename        =  "result.txt"
      settings.dataset_path           =  "examples/dataset.json"
      settings.template_path          =  "examples/template.txt"
      settings.section_join_character = ";"
    end
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
  end

  it "has a version number" do
    expect(Code::Gen::VERSION).not_to be nil
  end

  # it "generates a file without any error when given a good settings" do
  #   Code::Gen::Run.call

  #   expect(File.exist?(file_path)).to be true
  # end
end
