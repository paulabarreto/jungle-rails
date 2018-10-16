class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :name, presence: true
  validates :email, presence: true, case_sensitive: false, uniqueness: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by(email: email)

    if user.try(:authenticate, password)
      return user
    else nil
    end
  end
end
