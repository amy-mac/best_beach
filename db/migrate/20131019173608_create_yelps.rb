class CreateYelps < ActiveRecord::Migration
  def change
    create_table :yelps do |t|

      t.timestamps
    end
  end
end
