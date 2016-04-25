class Member::DashboardController < ApplicationController
	def home
		a = {title: "This is first title", description: "This is first description", amount: "Amount: 30", user: "FirstUser"}
		b = {title: "This is second title", description: "This is second description", amount: "This is second amount", user: "SecondUser"}
		c = {title: "This is third title", description: "This is third description", amount: "This is third amount", user: "ThirdUser"}
		d = {title: "This is fourth title", description: "This is fourth description", amount: "This is fourth amount", user: "FirstUser"}
		e = {title: "This is fith title", description: "This is fith description", amount: "This is fith amount", user: "SecondUser"}
		f = {title: "This is sixth title", description: "This is sixth description", amount: "This is sixth amount", user: "ThirdUser"}
		@array = [a, b, c, d, e, f]
	end
end