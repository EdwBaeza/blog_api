# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string
#  name                   :string
#  last_name              :string
#  second_last_name       :string
#  auth_token             :string
#  posts_count            :integer
#  is_premium             :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#
class UserSerializer < JSONAPI::Serializable::Resource
  type 'users'

  attributes :id, :name, :last_name, :posts_count, :created_at, :updated_at
end
