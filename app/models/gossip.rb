class Gossip < ApplicationRecord
  belongs_to :user
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips

  validates :title, 
    presence: true, 
    length: { in: 3..70 }
  validates :content, presence: true
end
