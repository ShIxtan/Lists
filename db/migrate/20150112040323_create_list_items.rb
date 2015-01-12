class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :text, null: false
      t.integer :list_id, index: true, null: false

      t.timestamps null: false
    end
  end
end
