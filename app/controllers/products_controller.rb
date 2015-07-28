class ProductsController < ApplicationController

  before_action :find_category
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @product = @category.products.build
  end

  def create
    @product = @category.products.create( permit_params )
    if @product.save
      flash[:notice] = "Data product has been saved"
      redirect_to category_path(@category)
    else
      flash[:notice] = "Can't saved"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update( permit_params )
      flash[:notice] = "Data have been updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = "Data success delete"
      redirect_to category_path(@category)
    else
       flash[:notice] = "Data can't delete"
       redirect_to category_path(@category)
    end
  end

  private
    # this function will make the category data available inside 
    # products controller
    def find_category
      @category = Category.find( params[:category_id] )
    end

  private
    def find_product
      @product = @category.products.find( params[:id] )
    end

  private
    def permit_params
      params.require(:product).permit( :pro_name, :pro_price, :pro_color )
    end

end
