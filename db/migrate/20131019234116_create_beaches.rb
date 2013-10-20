class CreateBeaches < ActiveRecord::Migration
  def change
    create_table :beaches do |t|
      t.string :name
      t.text :description
      t.string :main_image
      t.string :yelp_id

      t.timestamps
    end
  end
end
