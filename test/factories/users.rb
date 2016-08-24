FactoryGirl.define do
  factory :admin, class: User do
    name "Do Tuan Minh"
    email "minhdt.cntt@gmail.com"
    password "12345678"
    password_confirmation "12345678"
    role 0
    confirmed_at Time.now
  end
end