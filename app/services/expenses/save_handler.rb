class SaveHandler
	attr_accessor :user, :expense
	def initialize(expense, user, params)
		@expense, @user, @params = expense, user, params
	end

	def save_hard
		if @expense.new_record?
			if @expense.save
				if @params[:expense][:company] == "1"
					@expense.toggle! :company?
				end

				if @expense.company? == true
					user.comp.expense << @expense
					@expense.status = "Waiting to be confirmed"
					@expense.save
				else
					@expense.status = "Personal"
					@expense.save
				end
				@user.expense << @expense
				return "success"
			else
				return "error"
			end
		else 
			if @expense.save
				return "success"
			else
				return "error"
			end
		end
	end
end