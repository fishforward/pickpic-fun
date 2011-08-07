class AddCToPics < ActiveRecord::Migration
  def self.up
    add_column :pics, :scores, :int
    add_column :pics, :wins, :int
    add_column :pics, :losses, :int
  end

  def self.down
  end
end
