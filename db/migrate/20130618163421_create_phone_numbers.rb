class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.references :person

      t.timestamps
    end
    add_index :phone_numbers, :person_id
  end
end
