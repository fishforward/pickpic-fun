class AddKeynameToPics < ActiveRecord::Migration
  def self.up
    add_column :pics, :keyname, :string
  end

  def self.down
  end
end
