class ReviewsController < ApplicationController


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(:product => @product)
    @review.user_id = current_user

    @review.save!
  end
end
