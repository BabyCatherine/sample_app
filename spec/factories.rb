FactoryGirl.define do
  factory :user do
    sequence(:name)	 { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do #Добавление фабрики для административных пользователей. 
      admin true 
    end
  end

  factory :micropost do #фабрикa для микросообщений, микросообщения связаны с пользователем
    content "lorem ipsum"
    user
  end
end

#Фабрика для симуляции объектов модели User. 


#FactoryGirl.define do
 # factory :user do
  #  name     "Michael Hartl"
   # email    "michael@example.com"
    #password "foobar"
    #password_confirmation "foobar"
  #end
#end

