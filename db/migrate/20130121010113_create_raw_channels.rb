class CreateRawChannels < ActiveRecord::Migration
  def change
    create_table :raw_channels do |t|
      t.string :xmltv_id
      t.string :channel_name

      t.timestamps
    end
  end
end
