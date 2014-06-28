class MotionLayoutCell < UITableViewCell

	attr_accessor :nameLabel, :firstDateLabel, :lastDateLabel, :inquiryDateLabel

	def initWithStyle(style, reuseIdentifier: reuseIdentifier)
		super
		size = self.contentView.frame.size
		@nameLabel = newNameLabel
		@firstDateLabel = newFirstDateLabel
		@lastDateLabel = newLastDateLabel
		@inquiryDateLabel = newInquiryDateLabel

		addLabelsToSubview
  end

  def addLabelsToSubview

    Motion::Layout.new do |layout|
      layout.view  self.contentView
      layout.subviews 'nameLabel' => nameLabel, 'firstDateLabel' => firstDateLabel,
                      'lastDateLabel' => lastDateLabel, 'inquiryDateLabel' => inquiryDateLabel
      layout.vertical '|[nameLabel][inquiryDateLabel]'
      layout.vertical '|[firstDateLabel][lastDateLabel]'
      layout.horizontal '|-[nameLabel]'
      layout.horizontal '|-[firstDateLabel]'
      layout.horizontal '|-[inquiryDateLabel][lastDateLabel]'
    end
  end


	def newNameLabel
    label = UILabel.alloc.init
    label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)

    label
  end

  def newFirstDateLabel
    label = UILabel.alloc.init
    label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)

    label
  end

  def newLastDateLabel
    label = UILabel.alloc.init
    label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)

    label
  end

  def newInquiryDateLabel
    label = UILabel.alloc.init
    label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)

    label
  end
end
