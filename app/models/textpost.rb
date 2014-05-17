class Textpost

  include Mongoid::Document
  include Mongoid::Paperclip
  field :subject, type: String
  field :link, type: String
  field :content, type: String
  field :user, type: String
  field :date, type: Date
  
  belongs_to :idea
  
  
  has_mongoid_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end
