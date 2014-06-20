
class InquiryList < PM::TableScreen

  title 'Pending Inquiries'

  # searchable placeholder: 'Find Inquiry'
  # refreshable callback: :on_refresh,
  #             pull_message: 'Pull to refresh',
  #             refreshing: 'Refreshing Inquiries...',
  #             updated_format: 'last updated at %s',
  #             updated_time_format: '%l:%M %p'


  def on_load
    puts 'in on_load'
    set_nav_bar_button(:left, title: 'Help', action: :open_help_screen)
  end


	def will_appear
    puts 'in will_appear'
	  set_attributes self.view, {
	    background_color: hex_color('#2FFFFF')
	  }
	end

  def open_help_screen
    open_modal HelpScreen.new(nav_bar: true)
  end

  def open_inquiry(args)
    open InquiryDetail.new(inquiry_id: args[:inquiry_id])
  end


  def table_data
    puts 'in table_data'
    [{
        cells: (0..200).map do |n|
          {
              cell_identifier: EntryCell::ID,
              cell_class: EntryCell,
              height: 80 ,
          #    background_color: UIColor.grayColor,  # says to include this in styles yet it is in documentation valid
              styles: {         #still tells me to put this is styles hash
                  name: "Inquiry with a long name #{n}",
                  inquiry_date: '6/18/2014 9:30PM',
                  arrival: 'Aug 8, 2015',
                  departure: 'Aug 22, 2015',
                  nights: '14',
                  availability: 'Available',
                  arrow: 'arrow-available.png'
              }
          }
        end
     }]
  end

  def on_refresh
    end_refreshing
  end
end


