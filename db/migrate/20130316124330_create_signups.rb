class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :email
      t.string :phone
      t.string :ip
      t.string :country

      t.timestamps
    end
  end
end
