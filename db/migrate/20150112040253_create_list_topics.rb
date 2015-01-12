class CreateListTopics < ActiveRecord::Migration
  def change
    create_table :list_topics do |t|
      t.integer :author_id, null: false, index: true
      t.string :title, null: false, index: true, unique: true
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
