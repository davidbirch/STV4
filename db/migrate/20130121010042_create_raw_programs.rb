class CreateRawPrograms < ActiveRecord::Migration
  def change
    create_table :raw_programs do |t|
      t.string :title
      t.string :subtitle
      t.string :category
      t.string :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :region_name
      t.string :channel_xmltv_id

      t.timestamps
    end
  end
end
