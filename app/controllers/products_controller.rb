class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = @product.reviews.new
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_review
  #     @review = @product.reviews.find(params[:id])
  #   end
  #
  #   def set_product
  #     @product = Product.find(params[:product_id])
  #   end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def dog_params
    #   params.require(:dog)
    #     .permit(:name, :colour, :date_of_birth)
    #     .merge(owner: @owner)
    # end

end
