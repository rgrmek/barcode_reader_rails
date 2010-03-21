##########################################################################################
# File:     product.rb
# Project:  Barcode Reader
# Author:   Rob Grmek
# Desc:     The model for products which have associated images which contain the barcode
#           for each specific product.
##########################################################################################

class Product < ActiveRecord::Base

  has_attached_file :image
  validates_presence_of :barcode, :barcode_format
  before_validation :process_barcode

  def process_barcode
    self.barcode = %x{C:\\Program Files\\ZBar\\bin\\zbarimg -D "#{self.image.to_file.path}"}.scan(/\d+/).second
    self.barcode_format = %x{C:\\Program Files\\ZBar\\bin\\zbarimg -D "#{self.image.to_file.path}"}.scan(/[^:]*/).first
  end
end
