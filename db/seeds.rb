# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Organization.destroy_all

Organization.create!([{ name: 'Xing AG', password_digest: 'qwe123' }, { name: 'Yandex', password_digest: '123qwe' }, { name: 'e-legion', password_digest: 'q123we' }])

Organization.all.each do |org|
  org.teams.create! [
    { name: "Team 1", emails: "ellie@gmail.com, collin@gmail.com, robert@gmail.com"},
    { name: "Team 2", emails: "roma@gmail.com, rori@gmail.com"},
    { name: "Team 3", emails: "alla@gmail.com, nuna@gmail.com"}
  ]
end