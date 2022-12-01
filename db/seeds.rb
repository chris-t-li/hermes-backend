puts "Seeding Users..."
User.create(username: "Dovid", password: "123", email: "dovid@email.com")
User.create(username: "Taylan", password: "123", email: "taylan@email.com")
User.create(username: "Rob", password: "123", email: "rob@email.com")

puts "Seeding Senders..."
Sender.create(user_id: 1)
Sender.create(user_id: 2)
Sender.create(user_id: 3)

puts "Seeding Receivers..."
Receiver.create(user_id: 1)
Receiver.create(user_id: 2)
Receiver.create(user_id: 3)

puts "Seeding Conversations..."
Conversation.create(title: "Dovid & Taylan")
Conversation.create(title: "Dovid & Rob")
Conversation.create(title: "Group Chat")



puts "Seeding Messages..."
Message.create(content: Faker::Quote.famous_last_words, sender_id: 1, conversation_id: 1) # Dovid sending a msg to Taylan
5.times do
    Message.create(content: Faker::Quote.famous_last_words, sender_id: 3, conversation_id: 2) # Rob sending a 5x random msg to Dovid
end

Message.create(content: Faker::Quote.famous_last_words, sender_id: 3, conversation_id: 2) # Rob sending a msg to Dovid

# Group Conversation
2.times do 
    Message.create(content: Faker::Quote.famous_last_words, sender_id: 1, conversation_id: 3)
end

3.times do 
    Message.create(content: Faker::Quote.famous_last_words, sender_id: 2, conversation_id: 3)
end

puts "Seeding Message Receivers join..."
MessageReceiver.create(message_id: 1, receiver_id: 2)

5.times do |t|
    MessageReceiver.create(message_id: t+1, receiver_id: 1)
end

MessageReceiver.create(message_id: 7, receiver_id: 2)
MessageReceiver.create(message_id: 7, receiver_id: 3)
MessageReceiver.create(message_id: 8, receiver_id: 2)
MessageReceiver.create(message_id: 8, receiver_id: 3)

MessageReceiver.create(message_id: 9, receiver_id: 1)
MessageReceiver.create(message_id: 9, receiver_id: 3)
MessageReceiver.create(message_id: 10, receiver_id: 1)
MessageReceiver.create(message_id: 10, receiver_id: 3)
MessageReceiver.create(message_id: 11, receiver_id: 1)
MessageReceiver.create(message_id: 11, receiver_id: 3)

puts "Done :)"

