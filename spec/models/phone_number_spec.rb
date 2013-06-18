require 'spec_helper'

describe PhoneNumber do

  let(:person) do
    Person.create(first_name: "first_name", last_name: "last_name")
  end

  let(:phone_number) do
    phone = PhoneNumber.new(number: "1112223333")
    phone.person_id = person.id
    phone
  end

  it "is valid" do
    expect(phone_number).to be_valid
  end

  it "is invalid without a number" do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end

  it "is invalid without a 10-digit number" do
    phone_number.number = "ABC"
    expect(phone_number).to_not be_valid
  end

  it "must have a reference to a person" do
    phone_number.person_id = nil
    expect(phone_number).not_to be_valid
  end

  # you can use shoulda-matchers to do this
  it "is associated with a person" do
    expect(phone_number).to respond_to(:person)
    expect(phone_number.person).to eq person
  end
end
