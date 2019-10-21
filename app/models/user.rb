class User < ApplicationRecord
	
	belongs_to :role

	has_secure_password
	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :username, presence: true, uniqueness: true
	validates :password,
	        length: { minimum: 6 },
	        if: -> { new_record? || !password.nil? }
	has_many :accounts , dependent: :destroy
	has_many :friends , dependent: :destroy
	has_many :payees , dependent: :destroy


	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def full_name
		"#{self.first_name}  #{self.middle_name} #{self.last_name}"
	end

	def profile 
		{
			id: self.id,
			first_letter: self.full_name.delete(' ')[0],
			username: self.username,
			full_name: self.full_name,
			email: self.email,
			balance: self.balance_null_fix,
			friends: Friend.all
		}
	end

	def balance_null_fix
		if self.balance.blank?
			'00.00'
		else
			self.balance 
		end
	end
end
