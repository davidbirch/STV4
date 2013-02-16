class AddBlackFlagToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :black_flag, :boolean

  end
end
