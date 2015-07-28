class Category < ActiveRecord::Base

	has_many:products

	def self.find_data(search_val)
		where("cat_type LIKE ?", "%#{search_val}%")
	end
end
