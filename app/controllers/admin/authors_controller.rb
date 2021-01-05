class Admin::AuthorsController < Admin::BaseController
  def index
    @authors = Author.page(params[:page]).per Settings.panigate.category
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    @status = @author.save ? :success : @author.errors.messages
    respond_to do |format|
      format.js
    end
  end

  private

  def author_params
    params.require(:author).permit Author::AUTHOR_PARAMS
  end
end
