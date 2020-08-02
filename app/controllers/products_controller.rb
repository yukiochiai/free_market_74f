class ProductsController < ApplicationController
  def index
    @category_parent = Category.where(ancestry: nil)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.images.new
    @category_parent = Category.roots
  end

  def create
    @product = Product.new(product_params)
    if @product.images.present? && @product.save
      redirect_to root_path    
    else
      redirect_to  new_product_path
    end
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:id, :buyer_id, :name, :category_id, :brand, :status, :cost, :size, :judgment, :prefecture_id, :days, :price, :description, :seller_id, images_attributes: [:image]).merge(seller_id: current_user.id)
  end
end
