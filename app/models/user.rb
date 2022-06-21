class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
          validates :last_name
          validates :first_name
         end
         with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
          validates :last_name_katakana
          validates :first_name_katakana
        end

         validates :date_of_bath, presence: true

end
