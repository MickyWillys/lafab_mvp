namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    populateUser
    populateSkills if Skill.count < 50
    
  end
end 

namespace :db do
  desc "Fill rdatabase with sample data"
  task tag: :environment do

    tags = ["computer", "sport", "DIY", "science", "hobby", "leisure", "job"]
    @skills = Skill.all
    @skills.each do |s|
      r = rand(1..3)
      r.times do
        t= rand(1..7)
        s.tag_list.add(tags[t])
      end
      s.save
    end
      
  end
end 

def populateUser
  15.times do |n|
    myname = Faker::Name.first_name + " " + Faker::Name.last_name
    
    user_db = User.create!(name: myname)

    acc_user = Account.create(email:"example#{user_db.id}@lafab.net", 
                              password:"example#{user_db.id}", 
                              password_confirmation:"example#{user_db.id}", 
                              user_id: user_db.id)


    # r= rand(10)

    # r.times do
    #   user_id= user_db.id 
    #   tit = Faker::Lorem.words(3) * " "
    #   des = Faker::Lorem.sentences(3) * " "
    #   todo_user = Todo.create!(user_id: user_id ,title: tit,
    #                       description: des)
    # end
  end
end 

def populateSkills
  v = ["Copy", "Cut","Erase", "Play", "Do"]
  w =["guitare","computer", "bike","table","saw", "chair", "screen", "ball"]
  @users = User.all
  @users.each do |user|

    r= rand(10)

    r.times do
      tit = v[rand(0..4)] + " the " + w[rand(0..7)]
      des = Faker::Lorem.sentences(3) * " "
      todo_user = Skill.create!(user_id: user.id ,title: tit,
                          description: des)
    end
  end
end