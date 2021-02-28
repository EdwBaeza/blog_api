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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validate presence of email, name y auth_token" do
      should validate_presence_of(:email)
      should validate_presence_of(:name)
    end

    it "validate relations" do 
      should have_many(:posts)
    end
  end
end
