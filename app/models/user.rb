# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  auth_token :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
end
