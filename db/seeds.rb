puts "Cleaning database..."
User.destroy_all
Member.destroy_all
Band.destroy_all
Song.destroy_all
Partition.destroy_all
Comment.destroy_all

puts "Creating users..."
user1 = User.create!({ nickname: "Matteo", email: "matteo@gmail.com", password: "azerty" })
user2 = User.create!({ nickname: "Robin", email: "robin@gmail.com", password: "azerty" })
user3 = User.create!({ nickname: "Mohammed", email: "mohammed@gmail.com", password: "azerty" })

puts "Creating a band..."
band = Band.create!({ name: "U2", user: user1 })

puts "Creating members..."
member1 = Member.create!({ user: user1, band: band })
member2 = Member.create!({ user: user2, band: band })
member3 = Member.create!({ user: user3, band: band })

puts "Creating a song..."
song = Song.create!({ name: "The fly", description: "The Fly’s hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band })

puts "Creating partitions..."
partition1 = Partition.create!({ title: "Matteo's partition", instrument: "Drums", song: song, member: member1 })
partition2 = Partition.create!({ title: "Robin's partition", instrument: "Guitar", song: song, member: member2 })
partition3 = Partition.create!({ title: "Matteo's partition", instrument: "Piano", song: song, member: member3 })

puts "Creating comments..."
Comment.create!({ content: "Good job", time: Time.now, member: member1, partition: partition2 })
Comment.create!({ content: "It's ok", time: Time.now, member: member2, partition: partition3 })
Comment.create!({ content: "Perfect", time: Time.now, member: member3, partition: partition1 })

puts "Finished..."
