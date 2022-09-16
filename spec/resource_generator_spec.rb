require 'spec_helper'
require 'generator_spec'
require 'generators/rails/datatable/resource_generator'

RSpec.describe Rails::Datatable::ResourceGenerator, type: :generator do
  it "calls something" do
    run_generator ['User']
  end
end