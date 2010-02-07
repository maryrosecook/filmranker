class ViewController < ApplicationController
  
  def hide(params)
    View.hide(current_user, params[:id])
  end
  
  def seen(params)
    View.seen(current_user, params[:id])
  end
end