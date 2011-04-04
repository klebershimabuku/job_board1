class Resume < ActiveRecord::Base
	attr_accessible :name, :lastname, :birthday, :marital_status, :address, :city, :state_id, :user_id, :phone_number, :working, :possible_moving, :children, :qualities
	attr_accessible :notes, :gender, :height, :weight, :origin, :piercing, :tattoo, :vehicle, :japanese_level, :hits, :province_id
	
	validates :name, 						:presence => true
	validates :lastname, 				:presence => true
	validates :birthday,				:presence => true
	validates :marital_status,	:presence => true
	validates :address,					:presence => true
	validates :city,						:presence => true
	validates :phone_number,		:presence => true
	validates :working,					:inclusion => { :in => [true, false] }
	validates :possible_moving, :inclusion => { :in => [true, false] }
	validates :children,				:presence => true
	validates :qualities,				:presence => true
	validates :notes,						:presence => true
	validates :gender,					:presence => true
	validates :height,					:presence => true
	validates :weight,					:presence => true
	validates :origin,					:presence => true
	validates :piercing,				:inclusion => { :in => [true, false] }
	validates :tattoo,					:inclusion => { :in => [true, false] }
	validates :vehicle,					:inclusion => { :in => [true, false] }
	validates :japanese_level,	:presence => true
	
	belongs_to :user
	has_and_belongs_to_many :provinces
	
	paginates_per 100
	
	def full_name
		"#{name.capitalize} #{lastname.capitalize}"
	end
	
  def age
    idade = Time.now.strftime('%Y').to_i - birthday.strftime('%Y').to_i
    if birthday.strftime('%d-%m-%y') > Time.now.strftime('%d-%m-%y')
      idade
    else
      idade = idade-1
    end
  end
  
end