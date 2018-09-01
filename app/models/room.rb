class Room < ActiveRecord::Base
  belongs_to :users
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 23 }

end
