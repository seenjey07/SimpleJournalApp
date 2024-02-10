class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params.merge(username: current_user.username))
  
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = current_user.categories.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])
      if @category.update(category_params)
        redirect_to @category, notice: 'Category was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy

      respond_to do |format|
        format.html { redirect_to categories_path, notice: 'Category was successfully deleted.' }
        format.json { head :no_content }
      end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = current_user.categories.find(params[:id])
    end
end
