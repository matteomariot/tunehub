require "open-uri"

puts "Cleaning database..."
Comment.destroy_all
Partition.destroy_all
Song.destroy_all
Band.destroy_all
Member.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.new({ nickname: "Matteo", email: "matteo@gmail.com", password: "azerty" })
user2 = User.new({ nickname: "Robin", email: "robin@gmail.com", password: "azerty" })
user3 = User.new({ nickname: "Mohammed", email: "mohammed@gmail.com", password: "azerty" })

photo1 = URI.open('https://res.cloudinary.com/ddpetjmr6/image/upload/v1629470225/tljhb6akndmdriqxu9xoro01i4pb.jpg')
user1.photo.attach(io: photo1, filename: 'photomatteo.jpg', content_type: 'image/jpg')
user1.save!
photo2 = URI.open('https://res.cloudinary.com/ddpetjmr6/image/upload/v1629470141/qkd9arh3eyt79t4z7fxwrz0eg4qg.jpg')
user2.photo.attach(io: photo2, filename: 'photorobin.jpg', content_type: 'image/jpg')
user2.save!
photo3 = URI.open('https://res.cloudinary.com/ddpetjmr6/image/upload/v1629470072/j1vr1cidnu0x7680br0ard81m0gs.png')
user3.photo.attach(io: photo3, filename: 'photomohammed.png', content_type: 'image/png')
user3.save!

puts "Creating bands..."
band1 = Band.create!({ name: "U2", user: user1 })
band2 = Band.create!({ name: "Scorpions", user: user2 })

puts "Creating members..."
member1 = Member.create!({ user: user1, band: band1 })
member2 = Member.create!({ user: user2, band: band1 })
member3 = Member.create!({ user: user3, band: band1 })
member4 = Member.create!({ user: user1, band: band2 })
member5 = Member.create!({ user: user2, band: band2 })
member6 = Member.create!({ user: user3, band: band2 })

puts "Creating songs..."
song1 = Song.create!({ name: "The fly", description: "The Fly’s hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band1 })
song2 = Song.create!({ name: "We Are The People", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song3 = Song.create!({ name: "Rock You Like a Hurricane!", description: "Rock You Like a Hurricane! is a song by German rock band Scorpions, considered as their signature song.", band: band2 })
song4 = Song.create!({ name: "Trop cool une musique", description: "The Fly’s hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band1 })
song5 = Song.create!({ name: "Attention une autre", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song6 = Song.create!({ name: "Une musique qui déchire", description: "Rock You Like a Hurricane! is a song by German rock band Scorpions, considered as their signature song.", band: band2 })
song7 = Song.create!({ name: "Elle fait pleurer", description: "The Fly’s hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band1 })
song8 = Song.create!({ name: "92i Veyron", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song9 = Song.create!({ name: "Freestyle du sale", description: "Rock You Like a Hurricane! is a song by German rock band Scorpions, considered as their signature song.", band: band2 })
song10 = Song.create!({ name: "Biatch i have money", description: "The Fly’s hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band1 })
song11 = Song.create!({ name: "Big bitch", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song12 = Song.create!({ name: "On a de l'argent", description: "Rock You Like a Hurricane! is a song by German rock band Scorpions, considered as their signature song.", band: band2 })

puts "Creating partitions..."
partition1 = Partition.create!({ title: "Matteo's partition", instrument: "Drums", song: song1, member: member1 })
partition2 = Partition.create!({ title: "Robin's partition", instrument: "Guitar", song: song1, member: member2 })
partition3 = Partition.create!({ title: "Mohammed's partition", instrument: "Piano", song: song1, member: member3 })
partition4 = Partition.create!({ title: "Matteo's partition", instrument: "Drums", song: song2, member: member1 })
partition5 = Partition.create!({ title: "Robin's partition", instrument: "Guitar", song: song2, member: member2 })
partition6 = Partition.create!({ title: "Mohammed's partition", instrument: "Piano", song: song2, member: member3 })
partition7 = Partition.create!({ title: "Matteo's partition", instrument: "Drums", song: song3, member: member4 })
partition8 = Partition.create!({ title: "Robin's partition", instrument: "Guitar", song: song3, member: member5 })
partition9 = Partition.create!({ title: "Mohammed's partition", instrument: "Piano", song: song3, member: member6 })

puts "Creating comments..."
Comment.create!({ content: "Good job", time: Time.now, member: member1, partition: partition2 })
Comment.create!({ content: "It's ok", time: Time.now, member: member2, partition: partition3 })
Comment.create!({ content: "Perfect", time: Time.now, member: member3, partition: partition1 })
Comment.create!({ content: "Good job", time: Time.now, member: member1, partition: partition5 })
Comment.create!({ content: "It's ok", time: Time.now, member: member2, partition: partition6 })
Comment.create!({ content: "Perfect", time: Time.now, member: member3, partition: partition4 })
Comment.create!({ content: "Good job", time: Time.now, member: member1, partition: partition8 })
Comment.create!({ content: "It's ok", time: Time.now, member: member2, partition: partition9 })
Comment.create!({ content: "Perfect", time: Time.now, member: member3, partition: partition7 })

puts "Finished..."
