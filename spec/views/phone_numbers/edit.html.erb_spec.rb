require 'spec_helper'

describe "phone_numbers/edit" do
  before(:each) do
    @phone_number = assign(:phone_number, stub_model(PhoneNumber,
      :number => "MyString",
      :person => nil
    ))
  end

  it "renders the edit phone_number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do
      assert_select "input#phone_number_number[name=?]", "phone_number[number]"
      assert_select "input#phone_number_person[name=?]", "phone_number[person]"
    end
  end
end
