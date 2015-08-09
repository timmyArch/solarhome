class User < ActiveRecord::Base

  has_secure_password

  validates :username, presence: true
  validate :username_uniq_validator

  has_many :actors
  has_many :measurements

  private

  ##
  # Verfiy uniqness for update lockings from database.
  #
  # @return [void]
  #
  def username_uniq_validator
    a = self.class.where(username: self.username).lock(true).first
    errors.add(:username_not_uniq, self.username) if a and a != self
  end

end
