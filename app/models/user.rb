class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        enum role: { regular: 0, admin: 1 }

        # Validaciones para los campos adicionales
        validates :first_name, :last_name, :position, :department, presence: true
        validates :email, uniqueness: true
end
