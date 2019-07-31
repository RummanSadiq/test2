require 'securerandom'

class Article < ApplicationRecord
  	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
	validates :puid, presence: true

	before_validation :add_puid

	def add_puid
		self.puid = SecureRandom.hex(10);
	end
end
