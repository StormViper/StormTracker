class SaveHandler
	attr_accessor :user, :expense
	def initialize(expense, user, params, company)
		@expense, @user, @params, @company = expense, user, params, company
		return if !@expense || !@user || !@params || @company
	end

	def save_hard
  if @expense.save
    if @expense.company? == true
      if @params[:Branch]
        @branch = Branch.find_by_id(@params[:Branch].to_i)
        @branch.expense << @expense
      else
        @company.expense << @expense
        @expense.status = "Waiting to be confirmed"
        @expense.save
      end
    else
      @expense.status = "Personal"
      @expense.save
    end
      @user.expense << @expense
      return "success"
  else
    return "error"
  end
end
end
