class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_cart
    begin
      Cart.find(session[:cart_id])
    rescue
      cart=Cart.create
      session[:cart_id]=cart.id
      cart
    end
  end
end
