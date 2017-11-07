class ProductsController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.build(product_params)
    if @product.save
      redirect_to category_path @product.category.id
    else
      redirect_to category_path(params[:category_id])
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_path(params[:category_id])
  end

private
  def product_params
    params.require(:product).permit(:name, :price)
  end



end
