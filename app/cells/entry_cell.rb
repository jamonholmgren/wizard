
class EntryCell < PM::TableViewCell
  include PM::TableViewCellModule
  attr_accessor :title, :view, :layout, :name
  ID = 'EntryCellID'

  def layout
    @layout ||= EntryCellLayout.new
  end

  def setup(data_cell, table_screen)
    super
    $v = self
    self.view = layout.view
    self.contentView.addSubview layout.view
    self.setNeedsLayout
    self.layoutIfNeeded
    self
  end

  def name=(new_name)
    layout.name.text = new_name
  end

  def inquiry_date=(new_date)
    layout.inquiry_date.text = new_date
  end

  def last_date=(new_date)
    layout.last_date.text = new_date
  end

  def first_date=(new_date)
    layout.first_date.text = new_date
  end

  def layoutSubviews
    super
    self.updateConstraints
  end

  def updateConstraints
    super
    @layout.add_constraints(self)
  end
end

