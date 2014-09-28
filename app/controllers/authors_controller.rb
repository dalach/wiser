class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save!
      flash[:notice] = "Author added :)"
      redirect_to @author
    else
      render :new
    end
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author updated :)"
      redirect_to @author
    else
      redirect_to authors_path, error: 'Author was NOT updated.'
    end
  end

  def destroy
    if @author.destroy
      flash[:notice] = "Author destroyed"
      redirect_to authors_path
    else
      redirect_to authors_path, error: "Author was NOT destroyed"
    end
  end

  private
  def set_author
    @author = Author.find(params[:id])
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :family_name)
  end
end
