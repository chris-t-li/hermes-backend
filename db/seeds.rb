# puts "Seeding Users..."
# User.create(username: "David", password: "123", email: "david@email.com")
# User.create(username: "Taylor", password: "123", email: "taylor@email.com")
# User.create(username: "Rohan", password: "123", email: "rohan@email.com")

# puts "Seeding Conversations..."
# Conversation.create(title: "David & Taylor")
# Conversation.create(title: "David & Rohan")
# Conversation.create(title: "Group Chat")

puts "Seeding Participants"
Participant.create(conversation_id: 1, user_id: 1)
Participant.create(conversation_id: 1, user_id: 2)

Participant.create(conversation_id: 2, user_id: 1)
Participant.create(conversation_id: 2, user_id: 3)

Participant.create(conversation_id: 3, user_id: 1)
Participant.create(conversation_id: 3, user_id: 2)
Participant.create(conversation_id: 3, user_id: 3)

puts "Seeding Messages..."
Message.create(content: Faker::Quote.famous_last_words, user_id: 1, conversation_id: 1)
5.times do
    Message.create(content: Faker::Quote.famous_last_words, user_id: 3, conversation_id: 2)
end

Message.create(content: Faker::Quote.famous_last_words, user_id: 3, conversation_id: 2)

# Group Conversation
2.times do 
    Message.create(content: Faker::Quote.famous_last_words, user_id: 1, conversation_id: 3)
end

3.times do 
    Message.create(content: Faker::Quote.famous_last_words, user_id: 2, conversation_id: 3)
end


puts "Done :)"

