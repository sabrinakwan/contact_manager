require 'spec_helper'

describe "phone_numbers/show" do
  before(:each) do
    @phone_number = assign(:phone_number, stub_model(PhoneNumber,
      :number => "Number",
      :person => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(//)
  end
end
