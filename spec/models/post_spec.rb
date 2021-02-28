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
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it "validate presence of title, content, published and user_id" do
      should validate_presence_of(:title)
      should validate_presence_of(:content)
      should validate_presence_of(:user_id)
    end
  end
end
