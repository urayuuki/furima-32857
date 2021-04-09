FactoryBot.define do
  factory :user do
    email                         {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password
    password { password }
    password_confirmation { password }
     nickname                        {'yyy'}
     last_name                       {'かな'}
     first_name                    {'かな'}  
     last_name_kana          {'カナ'}        
     first_name_kana           {'カナ'}      
     birth_info    {'1999-12-21'}
  end
end