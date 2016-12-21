namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                        email: "example@railstutorial.org",
                        password: "foobar",
                        password_confirmation: "foobar",
                        admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6) #только первые шесть пользователей3 используя :limit опцию метода User.all:
    50.times do #мы сделаем 50 микросообщений для каждого пользователя
      content = Faker::Lorem.sentence(5) #сгенерируем образец содержимого для каждого микросообщения
      users.each { |user| user.microposts.create!(content: content) }
    end # Добавление микросообщений к образцам данных. 
  end
end

 #Код заполнителя образцов данных для создания административного пользователя. 