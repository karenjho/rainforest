class ReviewsController < ApplicationController

  before_action :load_product_review, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, only: [:create, :destroy]

  def show
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to products_path, notice: "Review successfully added for #{@product.name}!"
    else
      render "products/show"
    end
  end

  def edit
  end

  def update
    if @review.update_attributes(review_params)
      redirect_to product_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment) # <= product_id is not required because the form doesn't include product_id
  end

  def load_product_review
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end
end
