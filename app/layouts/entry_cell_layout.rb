
class EntryCellLayout < MK::Layout

  attr_accessor :availability_state

  view :name
  view :inquiry_date
  view :arrival
  view :departure
  view :availability
  view :nights
  view :channel
  # view :arrow

  def layout
    root :entry_cell do
      add UILabel, :name
      add UILabel, :inquiry_date
      add UILabel, :arrival
      add UILabel, :departure
      add UILabel, :availability
      add UILabel, :nights
      add UILabel, :channel
      add UILabel, :arrive_text
      add UILabel, :depart_text
      #add UIImage, :arrow

    end
  end

  def entry_cell_style
    background_color UIColor.lightGrayColor

  end

  def name_style
    puts "in name_style"
    numberOfLines 1
    font UIFont.boldSystemFontOfSize(16)
    textColor UIColor.whiteColor
    # shadowColor UIColor.whiteColor
    textAlignment UITextAlignmentLeft

  end

  def arrive_text_style
    common_style
    text 'Arrival'
  end

  def depart_text_style
    common_style
    text "Departure"
  end
  def inquiry_date_style
    common_style
    sizeToFit
  end

  def arrival_style
    right_side_style
    sizeToFit
  end

  def departure_style
    right_side_style
    sizeToFit
  end

  def availability_style
    right_side_style
    textColor availability_color(availability_state)
    sizeToFit
  end



  def add_constraints(cell)
    context(cell.contentView) do
      constraints(:inquiry_date) do
        bottom.equals(view).minus(2)
        left.equals(:name, :left)

      end

      constraints(:name) do
        min_top.is 0
        left.equals 4
        width.equals(250)

      end

      constraints(:depart_text) do
        right.equals(view).minus 70
        bottom.equals(view).minus(2)
        width.equals 80
      end

      constraints(:arrive_text) do
        left.equals(:depart_text)
        bottom.equals(:departure, NSLayoutAttributeTop)
        width.equals 80
      end

      constraints(:departure) do
        right.equals(view).minus(4)
        bottom.equals(view).minus(2)
      end

      constraints(:arrival) do
        right.equals(:departure, :right)
        bottom.equals(:departure, NSLayoutAttributeTop)
      end

      constraints(:availability) do
        min_top.equals 2
        right.equals(:departure, :right)
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

  def availability_color(availability)
    puts "Availability = #{availability}"
    case availability
      when 'Availability'
        color = UIColor.greenColor
      when 'Booked'
        color = UIColor.redColor
      when 'Tentative'
        color = UIColor.yellowColor
      else
        color = UIColor.greenColor
    end
    color
  end
end