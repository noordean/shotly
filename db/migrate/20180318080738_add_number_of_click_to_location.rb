class AddNumberOfClickToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :number_of_click, :integer
  end
end
