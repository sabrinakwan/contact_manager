class PhoneNumber < ActiveRecord::Base
  belongs_to :person
  attr_accessible :number, :person_id

  validates :number, format: {with: /\A\d{10}\z/}
  validates :person_id, presence: true

end
