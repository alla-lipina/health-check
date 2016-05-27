class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.datetime :start_at
      t.datetime :stop_at
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
