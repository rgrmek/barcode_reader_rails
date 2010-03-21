class AddBarcodeFormatToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :barcode_format, :string
  end

  def self.down
    remove_column :products, :barcode_format
  end
end
