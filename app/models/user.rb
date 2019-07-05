class User < ApplicationRecord

	has_secure_password
	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :username, presence: true, uniqueness: true
	validates :password,
	        length: { minimum: 6 },
	        if: -> { new_record? || !password.nil? }
	has_many :accounts
	has_many :friends

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
