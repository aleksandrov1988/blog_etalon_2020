module ApplicationHelper
  def error_messages_for(object)
    render 'error_messages_for', object: object
  end
end
