class Lecture < ApplicationRecord

  belongs_to :course
  has_many :sheet_links
  has_rich_text :description
  has_many :lecture_users
  has_many :users, through: :lecture_users

  def completed_by?(user)
    lecture_users.where(user_id: user.id).exists?
  end

  def current_user_completed?(user_id)
      users.where('users.id = ?', user_id).exists?
  end

  scope :completed_by, -> user_id {
    joins(:users).where('users.id = ?', user_id)
  }

  scope :orderd_by?, -> user_id {
    joins(:users).where('users.id = ?', user_id).exists?
  }


end
