class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :companyName
      t.string :address1
      t.string :address2
      t.string :country
      t.string :state
      t.string :city
      t.string :zip_code
      t.string :email
      t.string :contact1
      t.string :contact2
      t.timestamps
    end
  end
end
