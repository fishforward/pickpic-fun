class Photo < ActiveRecord::Base
  # validates_format_of :image, :with=>/^.*(.jpg|.JPG|.gif|.GIF)$/, :message => "Only jpg/gif Supported!"
  file_column :image, :magick => {       
          :versions => { "thumb" => "306x306!" }      
        }      
end