require 'spec_helper'
require 'generator_spec'
require 'generators/rails/datatable/install_generator'

RSpec.describe Rails::Datatable::InstallGenerator, type: :generator do
  it "calls something" do
    run_generator
  end
end