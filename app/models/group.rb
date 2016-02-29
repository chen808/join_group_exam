class Group < ActiveRecord::Base
	# might have to change the following if errors thrown
	has_one :join
	belongs_to :user
end
