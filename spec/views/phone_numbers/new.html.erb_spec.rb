require 'spec_helper'

describe "phone_numbers/new" do
  before(:each) do
    assign(:phone_number, stub_model(PhoneNumber,
      :number => "MyString",
      :person => nil
    ).as_new_record)
  end

  it "renders new phone_number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do
      assert_select "input#phone_number_number[name=?]", "phone_number[number]"
      assert_select "input#phone_number_person[name=?]", "phone_number[person]"
    end
  end
end
