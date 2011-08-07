class CreatePics < ActiveRecord::Migration
  def self.up
    create_table :pics do |t|
      t.string :title
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :pics
  end
end
