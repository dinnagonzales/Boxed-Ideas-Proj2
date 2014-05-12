class Textpost
  include Mongoid::Document
  field :subject, type: String
  field :content, type: String
  field :user, type: String
end
