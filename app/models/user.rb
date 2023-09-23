class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_permissions
  has_many :permissions, through: :user_permissions

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def can(ability)
    self.permissions.where(ability: ability).any?
  end
end
