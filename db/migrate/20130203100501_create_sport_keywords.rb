class CreateSportKeywords < ActiveRecord::Migration
  def change
    create_table :sport_keywords do |t|
      t.string :rule_type
      t.string :value
      t.integer :sport_id
      t.integer :priority

      t.timestamps
    end
  end
end
