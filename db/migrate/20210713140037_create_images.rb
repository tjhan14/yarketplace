class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :post_id

      t.timestamps
    end
  end
end
