class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :guid
      t.references :team, index: true, foreign_key: true
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
