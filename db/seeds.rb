require "open-uri"

puts "Cleaning database..."
Response.destroy_all
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
user4 = User.new({ nickname: "Kanak", email: "kanak@gmail.com", password: "azerty" })
user5 = User.new({ nickname: "Terence", email: "terence@gmail.com", password: "azerty" })
user6 = User.new({ nickname: "Sara", email: "sara@gmail.com", password: "azerty" })

# ** PHOTOS FOR USER **
photo1 = URI.open('https://res.cloudinary.com/ddpetjmr6/image/upload/v1629470225/tljhb6akndmdriqxu9xoro01i4pb.jpg')
user1.photo.attach(io: photo1, filename: 'photomatteo.jpg', content_type: 'image/jpg')
user1.save!
photo2 = URI.open('https://res.cloudinary.com/ddpetjmr6/image/upload/v1629470141/qkd9arh3eyt79t4z7fxwrz0eg4qg.jpg')
user2.photo.attach(io: photo2, filename: 'photorobin.jpg', content_type: 'image/jpg')
user2.save!
photo3 = URI.open('https://res.cloudinary.com/ddpetjmr6/image/upload/v1629470072/j1vr1cidnu0x7680br0ard81m0gs.png')
user3.photo.attach(io: photo3, filename: 'photomohammed.png', content_type: 'image/png')
user3.save!
photo4 = URI.open('http://2.bp.blogspot.com/-a83ZA-ePAr8/T-y7iOQsMhI/AAAAAAAAMHw/tMKQrehSlPs/s1600/Chihuahua-Wallpaper-20123.jpg')
user4.photo.attach(io: photo4, filename: 'photokanak.jpg', content_type: 'image/jpg')
user4.save!
photo5 = URI.open('https://pbs.twimg.com/profile_images/949815185656700929/jMmYzrG1.jpg')
user5.photo.attach(io: photo5, filename: 'phototim.jpg', content_type: 'image/jpg')
user5.save!
photo6 = URI.open('https://www.femina.ch/assets/content/migration/main/femina_45_sarah_biasini_01.jpg')
user6.photo.attach(io: photo6, filename: 'photosara.jpg', content_type: 'image/jpg')
user6.save!

puts "Creating bands..."
band1 = Band.create!({ name: "Les portes", user: user1 })
band2 = Band.create!({ name: "La Police", user: user1 })
band3 = Band.create!({ name: "The Chairs", user: user3 })
band4 = Band.create!({ name: "The spoons", user: user1 })
band5 = Band.create!({ name: "Turtle Vox", user: user2 })

# ** PHOTOS FOR BAND **
photo7 = URI.open('https://rockmecoffee.com/wp-content/uploads/2021/08/The-Doors-Elektra-Records-PR-photo.jpg')
band1.photo.attach(io: photo7, filename: 'photoportes.jpg', content_type: 'image/jpg')
band1.save!
photo8 = URI.open('https://frasesdelavida.com/wp-content/uploads/2018/05/Frases-de-The-Police.jpg')
band2.photo.attach(io: photo8, filename: 'photopolice.jpg', content_type: 'image/jpg')
band2.save!
photo9 = URI.open('https://comedybarn.com/wp-content/uploads/2019/02/bandquirky.jpg')
band3.photo.attach(io: photo9, filename: 'photochairs.jpg', content_type: 'image/jpg')
band3.save!
photo10 = URI.open('https://bonplanaparis.com/inc/img/evts/flyers/14739.jpg')
band4.photo.attach(io: photo10, filename: 'photospoon.jpg', content_type: 'image/jpg')
band4.save!
photo11 = URI.open('https://www.sainte-luce-loire.com/medias/2019/10/THEWACKIDS.jpg')
band5.photo.attach(io: photo11, filename: 'phototurtlevox.jpg', content_type: 'image/jpg')
band5.save!



puts "Creating members..."
# ** BAND 1 **
member1 = Member.create!({ user: user1, band: band1 })
member2 = Member.create!({ user: user2, band: band1 })
member3 = Member.create!({ user: user3, band: band1 })
member4 = Member.create!({ user: user4, band: band1 })
member5 = Member.create!({ user: user5, band: band1 })
# ** BAND 2 **
member6 = Member.create!({ user: user1, band: band2 })
member7 = Member.create!({ user: user2, band: band2 })
member8 = Member.create!({ user: user3, band: band2 })
member9 = Member.create!({ user: user5, band: band2 })
# ** BAND 3 **
member10 = Member.create!({ user: user1, band: band3 })
member11 = Member.create!({ user: user2, band: band3 })
# ** BAND 4 **
member12 = Member.create!({ user: user1, band: band4 })
member13 = Member.create!({ user: user2, band: band4 })
# ** BAND 5 **
member14 = Member.create!({ user: user1, band: band5 })
member15 = Member.create!({ user: user2, band: band5 })

puts "Creating songs..."
song1 = Song.create!({ name: "When The LiveCode’s Over", description: "Hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band1 })
song2 = Song.create!({ name: "Not To Touch The 404", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song3 = Song.create!({ name: "Every Rake You Take", description: "This music will be the opening for our next concert, we have to work on it to make it perfect. The new version is much better than the old one.", band: band2 })
song4 = Song.create!({ name: "Waiting For The DemoDay", description: "The Fly’s hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band1 })
song5 = Song.create!({ name: "Riders On The Form", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song6 = Song.create!({ name: "Orlane", description: "This girl is so amazing, we need to write a song about her. We can record it in a professional way to have a quality sound and try to play on the radio.", band: band2 })
song7 = Song.create!({ name: "Walking on the MadzMed", description: "Last music of our next show, we have to work it as much as possible. It would be nice to have the final version in 2 weeks. In the details it would be better to start soft and finish in a masterly way.", band: band2 })
# song8 = Song.create!({ name: "92i Veyron", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song9 = Song.create!({ name: "Invisible JS", description: "A little bit more committed and important song for us. The way we’re playing it right now is really good, nothing else to say. Good Job guys.", band: band2 })
# song10 = Song.create!({ name: "Biatch i have money", description: "The Fly’s hip-hop drum beat only adds to the song’s insanity, making it impossible not to want to dance to this bonkers track, rocking along to the intimidating guitar.", band: band1 })
# song11 = Song.create!({ name: "Big bitch", description: "In the making for three years, Dutch DJ and producer Garrix believed from the early stages of the creative process that Bono's vocals would be the perfect fit for 'We Are the People'.", band: band1 })
song12 = Song.create!({ name: "Message in the Slack", description: "The SlackBot messages really pushed me over the edge. Traumatized by the messages at 8pm to make my flashcards, I need to express this in our next music.", band: band2 })


puts "Creating partitions..."
partition1 = Partition.create!({ title: "Matteo's partition",
                                 instrument: "Drums",
                                 song: song1,
                                 member: member1,
                                 link: "",
                                 score: "612f3f7ae716e30013ef6f20",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition2 = Partition.create!({ title: "Robin's partition",
                                 instrument: "Guitar",
                                 song: song1,
                                 member: member2,
                                 link: "",
                                 score: "612f3f9ba11079001488b668",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition3 = Partition.create!({ title: "Mohammed's partition",
                                 instrument: "Piano",
                                 song: song1,
                                 member: member3,
                                 link: "",
                                 score: "612f3f287baacb0012b498b0",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition4 = Partition.create!({ title: "Matteo's partition",
                                 instrument: "Drums",
                                 song: song2,
                                 member: member1,
                                 link: "",
                                 score: "612f3f0ea11079001488ac86",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition5 = Partition.create!({ title: "Robin's partition",
                                 instrument: "Guitar",
                                 song: song2,
                                 member: member2,
                                 link: "",
                                 score: "612f3ef0c5b6720014cba7b9",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition6 = Partition.create!({ title: "Mohammed's partition",
                                 instrument: "Piano",
                                 song: song2,
                                 member: member3,
                                 link: "",
                                 score: "612f4050e531ed0013f03ce2",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition7 = Partition.create!({ title: "Matteo's partition",
                                 instrument: "Drumset",
                                 song: song12,
                                 member: member6,
                                 link: "",
                                 score: "5855bfe6b025383312ee07e7",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition8 = Partition.create!({ title: "Mohammed's partition",
                                 instrument: "Guitar",
                                 song: song12,
                                 member: member8,
                                 link: "",
                                 score: "612f4195a11079001488d93d",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition9 = Partition.create!({ title: "Robin's partition",
                                 instrument: "Bass Guitar",
                                 song: song12,
                                 member: member7,
                                 link: "",
                                 score: "612f40657baacb0012b4ad68",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition10 = Partition.create!({ title: "Mohammed's partition",
                                 instrument: "Piano",
                                 song: song3,
                                 member: member3,
                                 link: "",
                                 score: "612f4050e531ed0013f03ce2",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition11 = Partition.create!({ title: "Matteo's partition",
                                 instrument: "Drumset",
                                 song: song3,
                                 member: member6,
                                 link: "",
                                 score: "5855bfe6b025383312ee07e7",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition12 = Partition.create!({ title: "Tim's partition",
                                 instrument: "Guitar",
                                 song: song3,
                                 member: member8,
                                 link: "",
                                 score: "612f4195a11079001488d93d",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition13 = Partition.create!({ title: "Robin's partition",
                                 instrument: "Bass Guitar",
                                 song: song3,
                                 member: member7,
                                 link: "",
                                 score: "612f40657baacb0012b4ad68",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition14 = Partition.create!({ title: "Mohammed's partition",
                                 instrument: "Piano",
                                 song: song7,
                                 member: member3,
                                 link: "",
                                 score: "612f4050e531ed0013f03ce2",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition15 = Partition.create!({ title: "Matteo's partition",
                                 instrument: "Drumset",
                                 song: song7,
                                 member: member6,
                                 link: "",
                                 score: "5855bfe6b025383312ee07e7",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition16 = Partition.create!({ title: "Tim's partition",
                                 instrument: "Guitar",
                                 song: song7,
                                 member: member8,
                                 link: "",
                                 score: "612f4195a11079001488d93d",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition17 = Partition.create!({ title: "Robin's partition",
                                 instrument: "Bass Guitar",
                                 song: song9,
                                 member: member7,
                                 link: "",
                                 score: "612f40657baacb0012b4ad68",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition18 = Partition.create!({ title: "Matteo's partition",
                                 instrument: "Drumset",
                                 song: song9,
                                 member: member6,
                                 link: "",
                                 score: "5855bfe6b025383312ee07e7",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition19 = Partition.create!({ title: "Mohammed's partition",
                                 instrument: "Guitar",
                                 song: song6,
                                 member: member8,
                                 link: "",
                                 score: "612f4195a11079001488d93d",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition20 = Partition.create!({ title: "Robin's partition",
                                 instrument: "Bass Guitar",
                                 song: song6,
                                 member: member7,
                                 link: "",
                                 score: "612f40657baacb0012b4ad68",
                                 appid: "612de5048b4cfc0013a41f0a" })

partition21 = Partition.create!({ title: "Matteo's partition",
                                 instrument: "Drumset",
                                 song: song6,
                                 member: member6,
                                 link: "",
                                 score: "5855bfe6b025383312ee07e7",
                                 appid: "612de5048b4cfc0013a41f0a" })


puts "Creating comments..."
Comment.create!({ content: "Good job", time: Time.now, member: member1, partition: partition2 })
Comment.create!({ content: "It's ok", time: Time.now, member: member2, partition: partition3 })
Comment.create!({ content: "Perfect", time: Time.now, member: member3, partition: partition1 })
Comment.create!({ content: "Good job", time: Time.now, member: member1, partition: partition5 })
Comment.create!({ content: "It's ok", time: Time.now, member: member2, partition: partition6 })
Comment.create!({ content: "Perfect", time: Time.now, member: member3, partition: partition4 })
Comment.create!({ content: "Good job", time: Time.now, member: member1, partition: partition8 })
Comment.create!({ content: "It's ok", time: Time.now, member: member2, partition: partition9 })
Comment.create!({ content: "Not quite my tempo...", time: Time.now, member: member5, partition: partition7 })

puts "Finished..."
