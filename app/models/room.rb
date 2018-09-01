class Room < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 23 }

end
