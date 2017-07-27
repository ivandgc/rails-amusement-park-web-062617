class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  # validates :name, uniqueness: true
  # validates :name, :password, :password_confirmation, :height, presence: true

  def mood
    self.happiness > self.nausea ? 'happy' : 'sad'
  end
end
