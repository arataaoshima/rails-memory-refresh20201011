class Contact < ApplicationRecord
  validates :email, presence: true
  validates :contact_type, presence: { message: "を選択してください" }
  validates :content, presence: true
end
