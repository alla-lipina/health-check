class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.datetime :start_at
      t.datetime :stop_at

      t.timestamps null: false
    end
  end
end
