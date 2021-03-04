class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,              null: false
      t.text :content,              null: false
      t.string :first_choice
      t.string :second_choice
      t.string :third_choice
      t.boolean :comment,           null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
