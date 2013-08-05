class BlogpostsController < ApplicationController
  respond_to :html

  def new
    @blogpost = Blogpost.new
  end

  def create
    blogpost = Blogpost.new _blogpost_params
    flash[:success] = "Success" if blogpost.save
    flash[:error] = "Failed" unless blogpost.save
    redirect_to new_blogpost_path
  end

  def tag
    _blogpost.map do |bp|
      tag = bp.tags.find_or_create_by _tag_params
      flash[:success] = "Success"
    end
    redirect_to new_blogpost_path
  end

  private

  def _tag_params
    params.require(:tag).permit(:name)
  end

  def _blogpost
    Blogpost.where(:id => params[:id])
  end

  def _blogpost_params
    params.require(:blogpost).permit(:title, :content)
  end
end