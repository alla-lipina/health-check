class AddOrganizationToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :organization, index: true, foreign_key: true
  end
end
