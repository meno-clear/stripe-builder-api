class User < ApplicationRecord
  has_one :market_place_partner
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :addresses, as: :addressable
  def generate_jwt
     JWT.encode({id: id,
                 exp: 3.days.from_now.to_i},
                 ENV['SECRET_KEY_BASE'])
  end

end
