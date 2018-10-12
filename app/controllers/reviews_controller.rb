class ReviewsController < ApplicationController
  before_action :require_login

  def new
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(:product => @product, :description => params[:review][:description], :rating => params[:review][:rating])
    @review.user = current_user
    if @review.save
      redirect_to @product
    else
      redirect_to @product, notice: "error"
    end
  end
  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end
