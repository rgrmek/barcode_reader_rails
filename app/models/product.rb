##########################################################################################
# File:     product.rb
# Project:  Barcode Reader
# Author:   Rob Grmek
# Desc:     The model for products which have associated images which contain the barcode
#           for each specific product.
##########################################################################################

class Product < ActiveRecord::Base

  # a product has an associated image of a barcode
  has_attached_file :image

  # ensure that the image must have been processed before the product will save
  validates_presence_of :barcode, :barcode_format

  # process the barcode before validations are run
  before_validation :process_barcode

  # Processing a barcode image:
  #   will use the temporary file of the image that was uploaded and pass it to the 
  #   ZBar reader barcode scanning software which will attempt to decode the image
  def process_barcode
    tmp_file_path = image.to_file.path rescue nil
    if !tmp_file_path.nil?
      self.barcode = %x{C:\\Program Files\\ZBar\\bin\\zbarimg -D "#{self.image.to_file.path}"}.scan(/\d+/).second
      self.barcode_format = %x{C:\\Program Files\\ZBar\\bin\\zbarimg -D "#{self.image.to_file.path}"}.scan(/[^:]*/).first
    end
  end
end
