class AddOrganizationToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :organization, index: true, foreign_key: true
  end
end
