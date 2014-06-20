
class EntryCell < PM::TableViewCell
  include PM::TableViewCellModule
  attr_accessor :title, :view, :layout, :name
  ID = 'EntryCellID'

  def initWithStyle(style, reuseIdentifier:identifier)
    super
    #@layout = EntryCellLayout.new(root: self).build
    self
  end

  def setup(data_cell, table_screen)
    super
    @layout = EntryCellLayout.new #(root: self.view)
    self.view = @layout.view
    @layout.availability_state = data_cell[:styles][:availability]
    @layout.name.text = data_cell[:styles][:name]
    @layout.inquiry_date.text = data_cell[:styles][:inquiry_date]
    @layout.departure.text = data_cell[:styles][:departure]
    @layout.arrival.text = data_cell[:styles][:arrival]
    @layout.availability.text = data_cell[:styles][:availability]

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
