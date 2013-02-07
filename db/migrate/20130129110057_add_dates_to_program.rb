class AddDatesToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :start_datetime, :datetime

    add_column :programs, :end_datetime, :datetime

  end
end
