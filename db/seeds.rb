# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
today = Date.today
five_days_after = Date.today + 5.days
five_days_before = Date.today - 5.days

Organization.destroy_all
Survey.destroy_all
Token.destroy_all
Vote.destroy_all

Organization.create!([{ name: 'Xing AG', password: 'qwe123' }, { name: 'Yandex', password: '123qwe' }, { name: 'e-legion', password: 'q123we' }])

Organization.all.each do |org|
  org.teams.create! [
    { name: "Team 1", emails: "ellie@gmail.com, collin@gmail.com, robert@gmail.com"},
    { name: "Team 2", emails: "roma@gmail.com, rori@gmail.com"},
    { name: "Team 3", emails: "alla@gmail.com, nuna@gmail.com"}
  ]
  org.questions.create! [
    { title: "Do you like your work?", text: "lorem ipsum dolor sit amed"},
    { title: "Do you feel comfortable?", text: "lorem ipsum dolor sit amed"},
    { title: "Are you happy?", text: "lorem ipsum dolor sit amed"}
  ]
end

Survey.create!([
  { start_at: five_days_before, stop_at: today - 2.days },
  { start_at: five_days_before, stop_at: today }, 
  { start_at: today, stop_at: five_days_after }
])

Survey.all.each do |surv|
  Team.first.emails.split(/\s*,\s*/).each do
    Token.create!({ guid: SecureRandom.uuid, team_id: Team.first.id, survey_id: surv.id })
  end
end

Survey.all.each do |surv|
  Organization.first.questions.each do |q|
    Vote.create!([
      { value: rand(0.0...1.0), comment: "comment by team 1 for #{surv.id} and q = #{q.id}", team_id: Team.first.id, survey_id: surv.id, question_id: q.id },
      { value: rand(0.0...1.0), comment: "comment by team 1 for #{surv.id} and q = #{q.id}", team_id: Team.first.id, survey_id: surv.id, question_id: q.id },
      { value: rand(0.0...1.0), comment: "comment by team 1 for #{surv.id} and q = #{q.id}", team_id: Team.first.id, survey_id: surv.id, question_id: q.id }
    ])
  end
end


