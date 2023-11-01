require 'faker'

# Create cities
5.times do |i|
  City.create!(
  name: Faker::Address.city, 
  zip_code: Faker::Address.zip_code
  )
end

# Create users associated with cities
6.times do |i|
  first_name = Faker::Name.first_name 
  last_name = Faker::Name.last_name
  
  User.create!(
    first_name: first_name, 
    last_name: last_name, 
    email: "#{first_name.downcase}.#{last_name.downcase}@gmail.com", 
    age: Faker::Number.between(from: 10, to: 30),
    city_id: City.all.sample.id
  )
end

# Create gossips associated with a user
9.times do |i|
  title = Faker::Book.title #pour stopper la génération aléatoire si pas entre 3 et 25 chrs
  while title.length < 3 || title.length > 25
    title = Faker::Book.title
  end
  
  Gossip.create!(
    title: title,
    content: Faker::Quote.matz,
    user_id: User.all.sample.id
  )
end

# Create tags
10.times do |i|
  Tag.create!(
    title: Faker::Lorem.word
  )
end

# Add tags to gossips
Gossip.all.each do |gossip|
  rand(1..10).times do
    gossip.tags = Tag.all.sample(rand(1..10))
  end
  gossip.save!
end

# Create some private message
50.times do |i|
  PrivateMessage.create!(
    content: Faker::Lorem.paragraph(sentence_count: 3),
    sender_id: User.all.sample.id
  )
end

# Send thoses messages to one or multiple random user
PrivateMessage.all.each do |message|
  rand(1..5).times do
    JoinPrivateMessageReceiver.create!(
      private_message_id: message.id,
      receiver_id: User.all.sample.id
    )
  end
end