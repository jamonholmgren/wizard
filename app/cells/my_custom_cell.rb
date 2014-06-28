class MyCustomCell < UITableViewCell

  # This method is used by ProMotion to instantiate cells.
  def initWithStyle(style_name, reuseIdentifier: reuseIdentifier)
    super
    stylish
    self
  end

  # A delegate method when the user clicks the Row(it's blue by default)
  def setHighlighted(highlighted, animated: animated)
    if highlighted
      self.backgroundColor = UIColor.redColor
    else
      self.backgroundColor = UIColor.lightGrayColor
    end
  end

  def stylish
    self.backgroundColor = UIColor.whiteColor
    self.selectionStyle = UITableViewCellSelectionStyleNone
  end
end