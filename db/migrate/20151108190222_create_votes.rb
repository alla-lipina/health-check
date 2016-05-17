class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.float :value
      t.text :comment
      t.references :team, index: true, foreign_key: true
      t.references :vote, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
