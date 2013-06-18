require 'spec_helper'

describe Person do

  let(:first_name) do
    "Arjun"
  end

  let(:last_name) do
    "Patel"
  end

  let(:person) do
    Person.new(first_name: first_name, last_name: last_name)
  end

  it "is valid" do
    expect(person).to be_valid
  end

  context "when created without a first name" do
    let(:first_name) { nil }

    it "is invalid" do
      expect(person).to be_invalid
    end
  end

  context "when created without a last name" do
    let(:last_name) { nil }

    it "is invalid" do
      expect(person).to be_invalid
    end
  end

  it "has many phone numbers" do
    expect(person.phone_numbers).to eq([])
  end

end
