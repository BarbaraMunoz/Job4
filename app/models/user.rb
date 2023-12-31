class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        enum role: { regular: 0, admin: 1 }

        has_one_attached :avatar, dependent: :destroy
        has_many :applies, dependent: :destroy
        # Asociación para las ofertas laborales creadas por el admin
        has_many :job_offers, class_name: 'JobOffer'

        # Validaciones para los campos adicionales
        validates :first_name, :last_name, :position, :department, :bio, presence: true
        validates :email, uniqueness: true
        
        include PgSearch::Model

        pg_search_scope :search_by_name, against: [:first_name, :last_name]

        def default_avatar_url
          ActionController::Base.helpers.asset_path("default_avatar.jpg")
        end

        def full_name
          "#{first_name} #{last_name}"
        end

        def unread_applies_notifications_count
          applies = self.applies.joins(:job_offer)
          Notification.where(job_offer_id: applies.pluck(:job_offer_id), read: false).count
        end
end
