require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

# Create Wikis
50.times do
   wiki = Wiki.create(
    user:   users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
  

end
wiki = Wiki.all

# Create a member
 member = User.new(
   name:     'Member User',
   email:    'valeriemettler@gmail.com',
   password: 'helloworld',
 )
 member.skip_confirmation!
 member.save


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"



