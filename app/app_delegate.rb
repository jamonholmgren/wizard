class AppDelegate < PM::Delegate 
	def on_load(app, options)
    #open MotionLayoutScreen.new(nav_bar: true)
		#open MyAwesomeScreen.new(nav_bar: true)
	  open InquiryList.new(nav_bar: true)
	end
end
