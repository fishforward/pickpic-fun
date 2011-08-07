class CreatePhotos < ActiveRecord::Migration
  
  def self.up
    create_table :photos do |t|
      t.column :image,:string,:null=>true
      t.column :update_time,:datetime 
      t.column :created_on,:datetime 
    end
  end

  def self.down
    drop_table :photos
  end
  
end