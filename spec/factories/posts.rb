# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  title          :string
#  content        :string
#  published      :boolean          default(TRUE)
#  user_id        :bigint           not null
#  published_at   :datetime
#  unpublished_at :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { [true, false].sample }
    published_at { Time.current }
    user
  end
end
