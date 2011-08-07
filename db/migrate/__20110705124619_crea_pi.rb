class CreatePics < ActiveRecord::Migration
  def self.up
    create_table :pics do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :score
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end

  def self.down
    drop_table :pics
  end
end
