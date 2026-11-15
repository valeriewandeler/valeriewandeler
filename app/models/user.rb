class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :locked_pages, class_name: "Alchemy::Page", foreign_key: :locked_by, inverse_of: :locker

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  
  def alchemy_roles
    admin? ? %w[admin] : %w[editor]
  end

  def alchemy_display_name
    email_address
  end 

end


