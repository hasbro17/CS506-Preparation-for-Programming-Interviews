
class User < ActiveRecord::Base
	has_many :solution_submission
	attr_accessor :password

	has_attached_file :avatar, 
	:styles => {
		:small 	=>	["64x64", 		:jpg,	:quality => 70], 
		:med 	=> 	["100x100#",	:jpg,	:quality => 70],
		:large 	=> 	["200x200#",	:jpg,	:quality => 70]
	},
  :s3_host_name => ENV['S3_HOST_NAME'],
	:convert_options => {
		:small => '-set colorspace sRGB -strip',
		:med => '-set colorspace sRGB -strip',
		:large => '-set colorspace sRGB -strip'
	}

	before_save :encrypt_password
	after_save :clear_password

	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/
	validates :username, :presence => true, :uniqueness => true, :length => {:in => 3..20}
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true
	validates_presence_of :password_confirmation
	validates_length_of :password, :in => 6..20, :on => :create


#called on login to authenticate user
	def self.authenticate(params)
		if EMAIL_REGEX.match(params[:username_or_email])
			user = User.find_by_email params[:username_or_email]
		else
			user = User.find_by_username(params[:username_or_email])
		end
		if user && user.match_password(params[:login_password])
			return user
		else
			return false
		end
	end

#called to match given password to database password
	def match_password(login_password)
		if BCrypt::Password.new(hashed_password)==login_password
			return true
		end
	end

#encrypts a new password
	def encrypt_password
		unless password.blank?
			self.hashed_password = BCrypt::Password.create(password)
		end
	end

#called to clear password for security reasons
	def clear_password
		self.password = nil
	end

end
