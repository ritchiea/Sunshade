class RemoveCityNameColumn < ActiveRecord::Migration
  def up
    remove_column :users, :city_name
  end

  def down
    add_column :users, :city_name, :string  
  end
end
