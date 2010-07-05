class Avatar < ActiveRecord::Base
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :resize_to => '320x200>',
                 :thumbnails => { :thumb => '100x100>' }

  validates_as_attachment

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  def crop!(geometry)
    if self.thumbnailable?
      cropped_image = crop_image(geometry)
      unless cropped_image.nil?
        self.uploaded_data = {
          'content_type' => self.content_type,
          'filename' => self.filename,
          'tempfile' => write_to_temp_file(cropped_image.to_blob)
        }
        self.save!
      end
    end
  end

  private
  def crop_image(geometry)
    cropped_image = nil
    Avatar.with_image(self.full_filename) do |image| 
      cropped_image = image.crop(geometry[:crop_x].to_i,
                                 geometry[:crop_y].to_i,
                                 geometry[:crop_w].to_i,
                                 geometry[:crop_h].to_i)
    end
    cropped_image
  end
end
