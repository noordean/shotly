class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :shortened_url
      t.integer :number_of_click
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
