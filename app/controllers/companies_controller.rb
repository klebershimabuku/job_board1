#coding: utf-8
class CompaniesController < ApplicationController
	
	def index
		@provinces = Province.find(:all)
	end
	
	def edit
		@company = Company.find(params[:id])
		@provinces = Province.find(:all)
	end
	
	def update
		@company = Company.find(params[:id])
	
		if @company.update_attributes(params[:company])
			redirect_to(company_path(@company), :notice => "Dados da empresa atualizados com sucesso.")
		else
			render :action => 'edit'
		end
	end
	
	def new
		@company = Company.new
		@provinces = Province.find(:all)
	end
	
	def create
		@company = Company.new(params[:company])
		if @company.save
			redirect_to(companies_path, :notice => 'Empresa foi cadastrada com sucesso.')
		else
			render :action => 'new'
		end
	end
	
	def show
		@company = Company.find(params[:id])
		@comments = @company.comments.where('approved = ? OR ip = ?', true, request.remote_ip).all 
		@company.increase_pagehit	
	rescue ActiveRecord::RecordNotFound 
		redirect_to(companies_path, :notice => 'Página não encontrada.')
	end
	
	def destroy
		@company = Company.find(params[:id])
		@company.destroy
		redirect_to(companies_path, :notice => 'Empresa excluída com sucesso.')
	end

  def in
    @companies = Province.find_by_name(params[:id]).companies.paginate(:page => params[:page], :per_page => 100, :order => 'name')
  end	
	
end
