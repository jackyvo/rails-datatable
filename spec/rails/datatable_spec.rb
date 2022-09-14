RSpec.describe Rails::Datatable do
  it "has a version number" do
    expect(Rails::Datatable::VERSION).not_to be nil
  end

  it "have the base class" do
    expect(Rails::Datatable::Base.new.run).to eq(true)
  end
end
