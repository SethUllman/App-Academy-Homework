class User < ApplicationRecord

  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, uniqueness: true

  attr_reader :password

  after_initialize :ensure_session_token

  has_many :subs,
    foreign_key: :moderator_id,
    class_name: :Sub

  has_many :posts,
    foreign_key: :author_id,
    class_name: :Post

  has_many :comments,
  foreign_key: :author_id,
  class_name: :Comment

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.update!(session_token: User.generate_session_token)
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
