# frozen_string_literal: true

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
class PostSerializer < JSONAPI::Serializable::Resource
  type 'posts'

  attributes :title, :content, :user_id, :created_at, :updated_at

  belongs_to :user
end
