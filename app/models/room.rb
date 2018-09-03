class Room < ActiveRecord::Base
  belongs_to :user, optional: true
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: { maximum: 23 }

end
