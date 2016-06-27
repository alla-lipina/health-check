Organization.destroy_all
Survey.destroy_all
Token.destroy_all
Vote.destroy_all
Team.destroy_all

Organization.create!([{ name: 'Xing AG', password: 'qwe123' }, { name: 'Yandex', password: '123qwe' }, { name: 'e-legion', password: 'q123we' }])

Organization.first.teams.create! [
  { name: "Team 1", emails: "ellie@gmail.com, collin@gmail.com, robert@gmail.com"},
  { name: "Team 2", emails: "roma@gmail.com, rori@gmail.com"},
  { name: "Team 3", emails: "alla@gmail.com, nuna@gmail.com"}
]

Organization.first.questions.create! [
  { title: "Delivering Value", text: "(+) We deliver great stuff! We're proud of it and our stakeholders are really happy. (-) We deliver crap. We feel ashamed to deliver it. Our stakeholders hate us."},
  { title: "Easy to release", text: "(+) Releasing is simple, safe, painless and mostly automated. (-) Releasing is risky, painful, lots of manual work and takes forever. "},
  { title: "Fun", text: "(+) We love going to work and have great fun working together! (-) Boooooooring... "},
  { title: "Health of Codebase", text: "(+) We're proud of the quality of our code! It is clean, easy to read and has great test coverage. (-) Our code is a pile of dung and technical debt is raging out of control."},
  { title: "Learning", text: "(+) We're learning lots of interesting stuff all the time! (-) We never have time to learn anything. "},
  { title: "Mission", text: "(+) We know exactly why we are here and we’re really excited about it! (-) We have no idea why we are here, there's no high lever picture or focus. Our so called mission is completely unclear and uninspiring. "},
  { title: "Pawns or  Players", text: "(+) We are in control of our own destiny! We decide what to build and how to build it. (-) We are just pawns in a game of chess with no influence over what we build or how we build it. "},
  { title: "Speed", text: "(+) We get stuff done really quickly! No waiting and no delays. (-) We never seem to get anything done. We keep getting stuck or interrupted. Stories keep getting stuck on dependencies. "}
]

Organization.first.surveys.create! [
  { start_at: 5.days.ago, stop_at: 2.days.ago },
  { start_at: 5.days.since, stop_at: Date.today }, 
  { start_at: Date.today, stop_at: 5.days.since }
]

Team.first.emails.split(/\s*,\s*/).each do
  Token.create!({ guid: SecureRandom.uuid, team_id: Team.first.id, survey_id: Survey.last.id })
end

Organization.first.surveys.each do |surv|
  Organization.first.questions.each do |q|
    Vote.create!([
      { value: rand(0.0...1.0), comment: "comment by team 1 for #{surv.id} and q = #{q.id}", team_id: Team.first.id, survey_id: surv.id, question_id: q.id },
      { value: rand(0.0...1.0), comment: "comment by team 1 for #{surv.id} and q = #{q.id}", team_id: Team.first.id, survey_id: surv.id, question_id: q.id },
      { value: rand(0.0...1.0), comment: "comment by team 1 for #{surv.id} and q = #{q.id}", team_id: Team.first.id, survey_id: surv.id, question_id: q.id }
    ])
  end
end
