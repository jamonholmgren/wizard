class OtherCell < UITableViewCell
  include PM::TableViewCellModule
  attr_accessor :title, :view, :layout, :name
  ID = 'OtherCellID'

  def initWithStyle(style, reuseIdentifier:identifier)
    super
    puts "In OtherCell"
    @layout = OtherCellLayout.new
    self
  end

  def setup(data_cell, table_screen)
    super
    puts "in OtherCell Setup"
    self.view = @layout.view
    @layout.name.text = data_cell[:styles][:name]
    @layout.inquiry_date.text = data_cell[:styles][:inquiry_date]
    @layout.last_date.text = data_cell[:styles][:last_date]
    @layout.first_date.text = data_cell[:styles][:first_date]

     self.contentView.addSubview @layout.view
     self.setNeedsLayout
     self.layoutIfNeeded
    self
  end
  #self.accessoryImage.setImage(UIImage.imageNamed("arrow-#{color}.png"))

  def layoutSubviews
    super
    self.updateConstraints
  end

  def updateConstraints
    super
    @layout.add_constraints(self)
  end
end