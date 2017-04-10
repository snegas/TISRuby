require './db/migrate/20170407120444_add_attachment_photo_to_products.rb'

class RemoveImageColumnFromProductsAndCreateNewTableWithOneToMany < ActiveRecord::Migration
  def up
    AddAttachmentPhotoToProducts.new.down

    create_table :product_attachments do |t|
      t.integer :product_id
      t.attachment :photo
    end
  end

  def down
    drop_table :product_attachments

    AddAttachmentPhotoToProducts.new.up
  end
end
