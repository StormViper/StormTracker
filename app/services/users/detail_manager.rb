class DetailManager
	attr_accessor :user
	def initialize(user)
		return if !user
		@user = user
	end

	def check_details
		@errors = []
		u = @user

		if u.email == nil || u.email == ""
			@errors << "Email"
		end
		if u.address_line_one == nil || u.address_line_one == ""
			@errors << "Street name and number"
		end
		if u.address_line_two == nil || u.address_line_two == ""
			@errors << "Town/city"
		end
		if u.address_line_three == nil || u.address_line_three == ""
			@errors << "State/Borough"
		end
		if u.address_line_four == nil || u.address_line_four == ""
			@errors << "Post/Zip code"
		end
		if u.address_line_five == nil || u.address_line_five == ""
			@errors << "Country"
		end
		if u.first_name == nil || u.first_name == ""
			@errors << "First name"
		end
		if u.last_name == nil || u.last_name == ""
			@errors << "Last name"
		end
		if u.salary == nil || u.salary == ""
			@errors << "Last name"
		end

		return @errors
	end
end
