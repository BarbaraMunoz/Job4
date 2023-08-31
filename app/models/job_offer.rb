class JobOffer < ApplicationRecord
  belongs_to :user
  has_many :applies, dependent: :destroy

  def applied_by?(user)
    applies.exists?(user: user)
  end

  def applied_date(user)
    apply = applies.find_by(user: user)
    apply.created_at.strftime('%d/%m/%Y')
  end
  
end
