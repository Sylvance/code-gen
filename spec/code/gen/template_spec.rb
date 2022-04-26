# frozen_string_literal: true

RSpec.describe Code::Gen::Template do
  let(:template_path) { "examples/template.txt" }
  let(:template) { Code::Gen::Template.call(path: template_path) }
  let(:spec) { Gem::Specification.find_by_name("code-gen") }
  let(:erb_file_path) { "/#{spec.gem_dir}/lib/code/tmp/template.erb" }

  after do
    File.delete(erb_file_path) if File.exist?(erb_file_path)
  end

  it "converts the template to a temporary erb file" do
    template

    expect(File.exist?(erb_file_path)).to be true
  end

  it "outputs the template file path for temporary erb file" do
    expect(template).to eq(erb_file_path)
  end
end
