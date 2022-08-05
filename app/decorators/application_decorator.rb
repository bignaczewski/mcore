class ApplicationDecorator < Draper::Decorator
  def created_at
    object.created_at.strftime("%a %m/%d/%y")
  end
end
