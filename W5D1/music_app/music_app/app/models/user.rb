class User < ApplicationRecord
  validates :email, :session_token, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session

    this_token = SecureRandom.urlsafe_base64
    while User.exists?(session_token: this_token)
      this_token = SecureRandom.urlsafe_base64
    end
    this_token
  end

  def reset_session_token!
    # debugger
    self.session_token = User.generate_session
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)

  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = self.find_by(email: email)
    return nil if user.nil?
    if user.is_password?(password)
      return user
    # else
    #   reroute_to
    end
  end

  def ensure_session_token
    debugger
    self.session_token ||= User.generate_session
  end
end
