class ProductsController < ApplicationController

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]

    respond_to do |format|
      if @product.save!
        format.html { redirect_to @product.category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @product.category, notice: 'The product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
