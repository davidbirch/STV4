class AddXmltvIdToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :xmltv_id, :string

  end
end
