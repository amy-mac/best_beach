class CreateBeaches < ActiveRecord::Migration
  def change
    create_table :beaches do |t|

      t.timestamps
    end
  end
end
