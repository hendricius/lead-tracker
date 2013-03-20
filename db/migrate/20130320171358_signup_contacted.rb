class SignupContacted < ActiveRecord::Migration
  def change
    add_column :signups, :contacted_at, :datetime
  end
end
