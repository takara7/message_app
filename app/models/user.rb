class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  devise authentication_keys: [:user_name]

  acts_as_paranoid

  has_many :friendships_from_me, class_name: "Friendship", foreign_key: "user_id"
  has_many :friends, through: :friendships_from_me, source: :to_user

  has_many :friendships_to_me, class_name: "Friendship", foreign_key: "friend_id"
  has_many :followers, through: :friendships_to_me, source: :from_user

  has_many :talks_from_me, class_name: "Talk", foreign_key: "from_id"
  has_many :users_talking_to, through: :talks_from_me, source: :to_user

  has_many :talks_to_me, class_name: "Talk", foreign_key: "to_id"
  has_many :users_talking_to_me, through: :talks_to_me, source: :from_user

  validates :user_name, presence: true, uniqueness: {scope: :deleted_at},
            format: {with: /\A[\w_]+\z/, message: "英数字とアンダーバー(_)のみ使用できます"}

  def talk_users
    id_list = users_talking_to.pluck(:id) | users_talking_to_me.pluck(:id)
    User.where(id: id_list)
  end

    def email_required?
    false
  end

  def added_friend?(user)
    friends.include? user
  end

  def friendship_to(user)
    friendships_from_me.find_by(friend_id: user.id)
  end

  def friendship_from(user)
    friendships_to_me.find_by(user_id: user.id)
  end
end
