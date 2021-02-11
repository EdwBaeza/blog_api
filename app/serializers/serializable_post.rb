class SerializablePost < JSONAPI::Serializable::Resource
  type 'posts'

  attributes :title, :content, :user_id, :created_at, :updated_at

  belongs_to :user
end