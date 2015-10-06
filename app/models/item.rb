class Item < ActiveRecord::Base
	
	# item record must have a name
	# item record name must be 50 characters or less
	# item record name must be unique
	validates( :name , presence: true , length: { maximum: 50 } , uniqueness: true )

	# item record must have a quantity
	validates( :quantity , presence: true )
	
	# Item record asset numbers must be 50 characters or less
	validates( :asset_number, length: { maximum: 50 } )
end
