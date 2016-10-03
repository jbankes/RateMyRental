class Image < ActiveRecord::Base
  belongs_to :rental

  def generate_filename
     require 'securerandom'
     self.filename = SecureRandom.hex(20)
  end

end
