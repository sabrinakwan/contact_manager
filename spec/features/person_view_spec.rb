require 'spec_helper'

describe 'the person view', type: :feature do

  let(:person) {Person.create(first_name: 'John', last_name: 'Doe')}

  before (:each) do
    person.phone_numbers.create(number: "8585551234")
    person.phone_numbers.create(number: "8585556789")
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it "has a link to add a new phone number" do
    expect(page).to have_link("Add phone number", href: new_phone_number_path(person_id: person.id))
  end

  it "adds a new phone number" do
    page.click_link("Add phone number")
    page.fill_in("Number", with: '8885559999')
    page.click_button("Create Phone number")
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('8885559999')
  end

  context "edit phone number" do
    it "has links to edit phone numbers" do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end

    it "edits a phone number" do
      phone = person.phone_numbers.first
      old_number = phone.number
      new_number = "0003456788"

      page.find("#edit-phone-#{phone.id}").click
      page.fill_in('Number', with: "0123456788")
      page.click_button("Update Phone number")
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content(new_number)
      expect(page).to_not have_content(old_number)

    end
  end

  context "delete phone number" do
      it "has links to delete phone numbers" do
        person.phone_numbers.each do |phone|
          expect(page).to have_link('delete', href: phone_number_path(phone))
        end
      end

      it "deletes a phone number" do
        phone = person.phone_numbers.first
        old_number = phone.number
        new_number = "0003456788"

        page.find("#delete-phone-#{phone.id}").click
        expect(current_path).to eq(person_path(person))
        #expect(page).to have_content(new_number)
        expect(page).to_not have_content(old_number)
      end

    end

end