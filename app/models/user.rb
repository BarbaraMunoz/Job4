class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        enum role: { regular: 0, admin: 1 }

        has_one_attached :avatar
        has_many :applies, dependent: :destroy
        # Asociación para las ofertas laborales creadas por el admin
        has_many :job_offers, class_name: 'JobOffer'

        # Validaciones para los campos adicionales
        validates :first_name, :last_name, :position, :department, :bio, presence: true
        validates :email, uniqueness: true
        
        def default_avatar_url
          ActionController::Base.helpers.asset_path("default_avatar.jpg")
        end

        def full_name
          "#{first_name} #{last_name}"
        end
end
