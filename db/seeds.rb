puts "Seeding Users..."
User.create(username: "David", password: "123", email: "david@email.com", avatar_url: "https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/L2O5N7URKVCIFNHREK3MXROAB4.jpg")
User.create(username: "Taylor", password: "123", email: "taylor@email.com", avatar_url: "https://static01.nyt.com/images/2022/10/24/arts/24taylor-notebook3/24taylor-notebook3-superJumbo.jpg")
User.create(username: "Rohan", password: "123", email: "rohan@email.com")
# user_id: 4
User.create(username: "Rob", password: "rob", email: "lee.robert053@gmail.com", avatar_url: "https://i.kym-cdn.com/photos/images/newsfeed/002/062/139/5b8.jpg")

puts "Seeding Conversations..."
Conversation.create(title: "David & Taylor")
Conversation.create(title: "David & Rohan")
Conversation.create(title: "Group Chat")
# convo_id: 4
Conversation.create(title: "The Fun Zone") 

puts "Seeding Contacts..."
Contact.create(user_id: 1, friend_id: 2)
Contact.create(user_id: 1, friend_id: 3)
Contact.create(user_id: 2, friend_id: 3)
Contact.create(user_id: 4, friend_id: 1)
Contact.create(user_id: 4, friend_id: 2)

puts "Seeding Participants"
Participant.create(conversation_id: 1, user_id: 1)
Participant.create(conversation_id: 1, user_id: 2)


Participant.create(conversation_id: 2, user_id: 1)
Participant.create(conversation_id: 2, user_id: 3)

Participant.create(conversation_id: 3, user_id: 1)
Participant.create(conversation_id: 3, user_id: 2)
Participant.create(conversation_id: 3, user_id: 3)

Participant.create(conversation_id: 4, user_id: 4)
Participant.create(conversation_id: 4, user_id: 1)

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

3.times do 
    Message.create(content: Faker::Quote.famous_last_words, user_id: 4, conversation_id: 4)
end

3.times do 
    Message.create(content: Faker::Quote.famous_last_words, user_id: 1, conversation_id: 4)
end


puts "Done :)"

