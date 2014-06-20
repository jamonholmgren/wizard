
class HelpScreen < PM::WebScreen
  title  'Help'

  def on_load
    puts 'onload'
    set_nav_bar_button  :right, title: 'Done', action: :close_help_screen
    puts 'end onload'
  end


  def content
    puts 'content'
    NSURL.URLWithString("https://motioninmotion.tv/about")
  end


  def load_failed
    UIAlert.alloc.initWithTitle('Failed To Load',
      message: 'The help content failed to load. Double check your internet connection and try again',
      delegate: nil,
      cancelButtonTitle: 'OK',
      otherButtonTitle: nil
    ).show
  end

  def close_help_screen
    close
  end

end
