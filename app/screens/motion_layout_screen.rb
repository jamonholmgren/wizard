class MotionLayoutScreen < ProMotion::TableScreen

  def on_init
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone #To remove the cell's separator
    self.tableView.backgroundColor = UIColor.yellowColor
  end

  def table_data
    [{
         cells: (1..100).to_a.collect {|c|
           {
               #title: "Cell at row #{c}",
               cell_identifier: 'MotionID',
               cell_class: MotionLayoutCell,
               height: 90,
               styles: {         #still tells me to put this is styles hash
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
end