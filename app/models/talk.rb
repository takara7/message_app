class Talk < ApplicationRecord
  acts_as_paranoid

  belongs_to :from_user, class_name: "User", foreign_key: :from_id
  belongs_to :to_user, class_name: "User", foreign_key: :to_id

  default_scope -> { order("talks.created_at") }
  scope :talk_list, -> (user1, user2) {
    user_id1, user_id2 = [user1, user2].map do |user|
      case user
      when Integer
        user
      when String
        User.find_by(user_name: user).id
      when User
        user.id
      else
        raise ArgumentError, "引数の型が不正です"
      end
    end

    where(from_id: user_id1, to_id: user_id2).or \
      where(from_id: user_id2, to_id: user_id1)
  }
end
