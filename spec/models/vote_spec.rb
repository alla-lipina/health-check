require "rails_helper"

RSpec.describe Vote, :type => :model do

  describe "#avg" do
    # let(:votes) do 
    #   6.times.to_a.map do |t| 
    #     [
    #       Vote.create!(value: (t.to_f / 5), comment: "Blabla", question_id: 3, team_id: 1, survey_id: 1),
    #       Vote.create!(value: (t.to_f / 5), comment: "Blabla", question_id: 3, team_id: 2, survey_id: 2),
    #       Vote.create!(value: (t.to_f / 5), comment: "Blabla", question_id: 3, team_id: 2, survey_id: 2)
    #     ]
    #   end.flatten
    # end

    before do
      6.times do |t|
        Vote.create!(value: (t.to_f / 5), comment: "Blabla", question_id: 3, team_id: 1, survey_id: 2)
      end
    end

    it "returns correct value" do
      expect(Vote.avg).to eq(0.5)
    end

    it "returns correct value when sorted by team" do
      expect(Vote.by_team(1).avg).to eq(0.5)
    end

    it "returns correct value when sorted by survey" do
      expect(Vote.by_survey(2).avg).to eq(0.5)
    end

    it "returns correct value when sorted by question" do
      expect(Vote.by_question(3).avg).to eq(0.5)
    end

  end
end