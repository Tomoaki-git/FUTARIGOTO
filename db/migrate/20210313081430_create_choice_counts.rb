class CreateChoiceCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :choice_counts do |t|
      t.boolean :first_choice_count,   null: false
      t.boolean :second_choice_count,  null: false
      t.boolean :third_choice_count,   null: false
      t.references :user,              foreign_key: true
      t.references :post,              foreign_key: true
      t.timestamps
    end
  end
end
