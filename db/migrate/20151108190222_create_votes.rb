class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.float :value
      t.text :comment
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
