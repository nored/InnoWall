class Wall < ApplicationRecord
	has_many :pictures
	has_many :videos
	has_many :texts
end
