namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    users = User.all(limit: 6)
    5.times do
      name = Faker::Name.name
      email = Faker::Internet.email
      users.each { |user| user.family_members.create!(name: name, email_id: email) }
    end
  end
end