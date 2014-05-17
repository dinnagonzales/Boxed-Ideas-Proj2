class Idea
  include Mongoid::Document
  field :title, type: String
  field :published, type: Date

  belongs_to :user
  has_many :textposts
end
