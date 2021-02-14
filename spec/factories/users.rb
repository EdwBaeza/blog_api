# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string
#  name             :string
#  last_name        :string
#  second_last_name :string
#  auth_token       :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    auth_token { "FAKETOKEN0001" }
  end
end
