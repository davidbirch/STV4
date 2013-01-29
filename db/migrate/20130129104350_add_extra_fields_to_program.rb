class AddExtraFieldsToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :category, :string

    add_column :programs, :description, :string

  end
end
