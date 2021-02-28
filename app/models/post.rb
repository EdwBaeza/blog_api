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
class Post < ApplicationRecord
  include ::PgSearch::Model
  pg_search_scope :search,
                  against: [:title, :content],
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user, counter_cache: true
  
  validates :title, presence: true
  validates :content, presence: true
  validates :published, inclusion: { in: [true, false] }
  validates :user_id, presence: true

  scope :published, -> { where(published: true) }
end
