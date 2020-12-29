class Admin::CategoriesController < Admin::BaseController
  before_action :find_category, only: :show
  def index
    @categories = Category.page(params[:page]).per Settings.panigate.category
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    @status = @category.save ? :success : @category.errors.messages
    respond_to do |format|
      format.js
    end
  end

  def show
    @books = @category.books
  end
  private

  def find_category
    @category = Category.find params[:id]
    render_404 if @category.blank?
  end

  def category_params
    params.require(:category).permit Category::CATEGORY_PARAMS
  end
end
