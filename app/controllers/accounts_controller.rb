# encoding: utf-8
class AccountsController < ApplicationController
	
	def free
		@user_id = params[:id]
		# check for existence
		@exist = Account.find_by_user_id(@user_id)
		unless @exist
			@account = Account.create!(:user_id => @user_id, :active_pack => 'free', :valid_start_at => Time.now, :valid_end_at => Time.now + 100.years, :created_at => Time.now, :updated_at => Time.now)	
			redirect_to(user_path, :notice => "Conta gratuita definida com sucesso.")
		else
			redirect_to(users_path, :notice => "Usuário já possui conta definida.")
		end
	end
	
	def special
		@user_id = params[:id]
		# check for existence
		@exist = Account.find_by_user_id(@user_id)
		unless @exist
			@account = Account.create!(:user_id => @user_id, :active_pack => 'special', :valid_start_at => Time.now, :valid_end_at => Time.now + 1.year, :created_at => Time.now, :updated_at => Time.now)	
			redirect_to(user_path, :notice => "Conta gratuita definida com sucesso.")
		else
			redirect_to(users_path, :notice => "Usuário já possui conta definida.")
		end		
	end
	
end