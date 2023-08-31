class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer


  validates :user_id, uniqueness: { scope: :job_offer_id, message: 'Ya te has postulado a esta oferta.' }
end
