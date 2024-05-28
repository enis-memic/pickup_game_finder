class AddDetailsToPickups < ActiveRecord::Migration[7.1]
  def change
    add_column :pickups, :date, :date
    add_column :pickups, :time, :time
    add_column :pickups, :max_people, :integer
    add_column :pickups, :min_people, :integer
  end
end
