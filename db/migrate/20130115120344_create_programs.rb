class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :subtitle
      t.integer :region_id
      t.integer :sport_id
      t.integer :channel_id

      t.timestamps
    end
    
    add_index :programs, :region_id
    add_index :programs, :sport_id
  end
end
