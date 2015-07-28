class CategoriesController < ApplicationController

	before_action:find_category, only: [:show, :edit, :destroy, :update]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def show
	end

	def create
		@category = Category.create( permit_params )
		if @category.save
			respond_to do |format|
				format.html { redirect_to action: 'index', notice: 'New category was added' }
			end
		else
			flash[:notice] = "Can't create category"
			render 'new'
		end
	end

	def edit		
	end

	def update
		if @category.update( permit_params )
			respond_to do |format|
				format.html { redirect_to @category, notice: 'Successfull Updated Data!!!!'}
			end
		else
			flash[:notice] = "Can't create category"
			render 'edit'
		end
	end

	def destroy
		if @category.destroy
			respond_to do |format|
				format.html { redirect_to action: 'index', notice: 'Successfull Delete Data!!!!'}
			end
		else
			flash[:notice] = "Can't Delete category"
			render 'index'
		end
	end

	def search_form
		if params[:cat_type]
			@data = Category.find_data( params[:cat_type] )
		else
			# just display form only
		end
	end

	private
		def permit_params
			parameters = :cat_name, :cat_type, :cat_quantity
			params.require(:category).permit( parameters )
		end

	private 
		def find_category
			@category = Category.find( params[:id] )
		end
end
