# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
code_cat = Category.create!(
  name: 'code'
)

work_cat = Category.create!(
  name: 'work'
)

testos = User.create!(
  name: 'Testos Teroni',
  email: 'testos@teroni.fi',
  password: 'secretos',
  role: 'admin'
)

art1 = code_cat.articles.build(
  title: "Handling Signals",
  intro: "The way that you define signal-specific behaviour is to ‘trap’ the signal, specifying some behaviour that should be executed when the signal is received.",
  extended: "Try running this program. On the second last line, the current process id (pid) is printed. You can plug this in to the kill(1) command to see what happens when you send signals to your process.",
  user_id: testos.id,
  category_id: code_cat.id
)

art2 = work_cat.articles.build(
  title: "Doing a Paf gig on XPRS",
  intro: "First time on Viking Line doing a Paf gig. XPRS goes between HEL&mdash;TAL.",
  extended: "This gig is pretty awesome. You just have to adapt to different situations and control the moment.",
  user_id: testos.id,
  category_id: work_cat.id
)

art1.save!
art2.save!

# comment1 = art1.comments.build(
# )
# 
# comment2 = art1.comments.build(
# )
# 
# comment1.save!
# comment2.save!

