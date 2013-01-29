class AddExtraFieldsToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :short_name, :string

    add_column :channels, :free_or_pay, :string

  end
end
