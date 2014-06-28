class EntryCellLayout < MK::Layout


  view :name
  view :inquiry_date
  view :first_date
  view :last_date



  def layout
    root :entry_cell do
      add UILabel, :name
      add UILabel, :inquiry_date
      add UILabel, :first_date
      add UILabel, :last_date

      add UILabel, :first_text
      add UILabel, :last_text


    end
  end

  def entry_cell_style
    background_color UIColor.lightGrayColor

  end

  def name_style
    numberOfLines 1
    font UIFont.boldSystemFontOfSize(16)
    textColor UIColor.whiteColor
    # shadowColor UIColor.whiteColor
    textAlignment UITextAlignmentLeft

  end

  def first_text_style
    common_style
    text 'First Class'
  end

  def last_text_style
    common_style
    text 'Last Class'
  end
  def inquiry_date_style
    common_style
    sizeToFit
  end

  def first_date_style
    right_side_style
    sizeToFit
  end

  def last_date_style
    right_side_style
    sizeToFit
  end





  def add_constraints(cell)
    context(cell.contentView) do
      constraints(:entry_cell) do
        top.equals(:superview)
        bottom.equals(:superview)
        left.equals(:superview)
        right.equals(:superview)
      end

      constraints(:inquiry_date) do
        bottom.equals(view).minus(2)
        left.equals(:name, :left)

      end

      constraints(:name) do
        min_top.is 0
        left.equals 4
        width.equals(250)

      end

      constraints(:last_text) do
        right.equals(view).minus 75
        bottom.equals(view).minus(2)
        width.equals 80
      end

      constraints(:first_text) do
        left.equals(:last_text)
        bottom.equals(:last_text, NSLayoutAttributeTop)
        width.equals 80
      end

      constraints(:last_date) do
        right.equals(view).minus(4)
        bottom.equals(view).minus(2)
      end

      constraints(:first_date) do

        right.equals(:last_date, :right)
        #right.equals(view).minus(2)
        bottom.equals(:last_date, NSLayoutAttributeTop)
      end
    end
  end

  private
  def common_style
    numberOfLines 1
    font UIFont.boldSystemFontOfSize(12)
    textColor UIColor.blackColor
    #shadowColor UIColor.whiteColor
    textAlignment UITextAlignmentLeft
  end

  def right_side_style
    numberOfLines 1
    font UIFont.boldSystemFontOfSize(12)
    textColor UIColor.blackColor
    #shadowColor UIColor.whiteColor
    textAlignment UITextAlignmentRight
  end


end
