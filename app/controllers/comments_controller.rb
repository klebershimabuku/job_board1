# encoding: utf-8
class CommentsController < ApplicationController
	
  load_and_authorize_resource

	respond_to :html, :js
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.ip = request.remote_ip
    if @comment.save
      flash[:notice] = "Obrigado por enviar seu comentário!"
	    @total = Comment.find_all_by_commentable_id(@comment.commentable_id).count
    else
    	flash[:error] = "Ops! não foi possível enviar seu comentário. Verifique se todos os campos foram preenchidos corretamente."     	
    end
    respond_with(@comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @company = @comment.commentable_id
    @comment.destroy
    @total = Comment.find_all_by_commentable_id(@comment.commentable_id).count
    flash[:notice] = "Comentário removido com sucesso."
    respond_with(@comment) do |format|
			format.html { redirect_to(comments_manager_path, :notice => "Comentario removido com sucesso.") }
    end
  end

  def index
  	@commentable = Company.find(params[:company_id])
  	@comments = @commentable.comments.recent.where(:approved => true).all
  end

	def show
	end
	
	def manager
		@comments = Comment.where(:approved => false).all	
	end
	
	def approve
		@comment = Comment.find(params[:id])
		@comment.approve!
		flash[:notice] = "Comentário aprovado com sucesso."
		redirect_to comments_manager_path
	end
	
	def list
	  @search = Comment.search params[:search]
	  @comments = @search.page params[:page]
	end

	
end