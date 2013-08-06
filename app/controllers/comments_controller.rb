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

  def toggle_abusive
    comment = Comment.find(params[:id])
    comment.toggle_abusive
  end

  def thumb_up
    Vote.thumb_up(current_user, params[:id])
    @comment = Comment.find(params[:id])
  end

  def thumb_down
    Vote.thumb_down(current_user, params[:id])
    @comment = Comment.find(params[:id])
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
