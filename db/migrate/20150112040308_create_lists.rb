class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.integer :author_id, null: false
      t.integer :list_topic_id, null: false

      t.timestamps null: false
    end

    add_index :lists, [:author_id, :list_topic_id], unique: true
  end
end
