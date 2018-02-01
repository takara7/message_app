class Friendship < ApplicationRecord
  belongs_to :from_user, class_name: "User", foreign_key: "user_id"
  belongs_to :to_user,   class_name: "User", foreign_key: "friend_id"

  validates :user_id, presence: true, uniqueness: {scope: :friend_id}
  validates :friend_id, presence: true
end
