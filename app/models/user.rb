class User < ActiveRecord::Base
	has_many :solution_submission
	attr_accessor :password

	before_save :encrypt_password
	after_save :clear_password

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	validates :username, :presence => true, :uniqueness => true, :length => {:in => 3..20}
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates_presence_of :password_confirmation
	validates :password, :confirmation => true
	validates_length_of :password, :in => 6..20, :on => :create

	def self.authenticate(params)
		logger.info("authenticating")
		if EMAIL_REGEX.match(params[:username_or_email])
			user = User.find_by_email params[:username_or_email]
		else
			user = User.find_by_username(params[:username_or_email])
		end
		puts user
		if user && user.match_password(params[:login_password])
			return user
		else
			return false
		end
	end


	def match_password(login_password)
		puts BCrypt::Engine.hash_secret(login_password, salt)
		if hashed_password == BCrypt::Engine.hash_secret(login_password, salt)
			return true
		end
	end

	def encrypt_password
		unless password.blank?
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password = BCrypt::Engine.hash_secret(:password, salt)
		end
	end

	def clear_password
		self.password = nil
	end

end
