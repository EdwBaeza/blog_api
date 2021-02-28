# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  email            :string
#  name             :string
#  last_name        :string
#  second_last_name :string
#  auth_token       :string
#  posts_count      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
end
