class ReviewsController < ApplicationController

  before_action :load_product
  before_action :load_review, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, only: [:create, :destroy]

  def show
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save

      @reviews = @product.reviews

      respond_to do |format|
        format.html do
          redirect_to product_path(@product), notice: "Review added."
        end

        format.js
      end

    else
      render product_path(@product)
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

  def load_review
    @review = Review.find(params[:id])
  end
  def load_product
    @product = Product.find(params[:product_id])
  end
end
