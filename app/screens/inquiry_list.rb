
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


  def numberOfSectionsInTableView(tableView)
    1
  end


  def table_data
    puts 'in table_data'
    [{
         cells: (1..100).to_a.collect {|c|
           {
               #title: "Cell at row #{c}",
               cell_identifier: 'OtherID',
               cell_class: EntryCell,
               height: 90,
               style: {
                  name: "Inquiry with a long name #{c}",
                  inquiry_date: '6/18/2014 9:30PM',
                  first_date: 'Aug 8, 2015',
                  last_date: 'Aug 15, 2015',
                  arrow: 'arrow-available.png'
               }
           }
         }
     }]
  end

  def on_refresh
    end_refreshing
  end
end


