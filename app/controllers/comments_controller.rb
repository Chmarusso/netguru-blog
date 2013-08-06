class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def create
    @comment = Comment.new(params[:comment]) 
    @comment.user = current_user
    if @comment.save
      redirect_to :back unless request.xhr?
    else
      render :new
    end
  end
end
