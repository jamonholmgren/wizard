class AppDelegate < PM::Delegate 
	def on_load(app, options)
		open InquiryList.new(nav_bar: true)
	end
end
