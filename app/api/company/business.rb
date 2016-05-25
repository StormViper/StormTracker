module Business
	class Create < Grape::API
		version 'v1', using: :path
		format :json

		helpers do
			def get_all_company
				@company = Company.all
			end
		end
		resource :company do
			get :comp do
				get_all_company
			end
		end
	end
end