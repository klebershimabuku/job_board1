#encoding: UTF-8
class Resume < ActiveRecord::Base
	attr_accessible :name, :lastname, :birthday, :marital_status, :address, :city, :state_id, :user_id, :phone_number, :working, :possible_moving, :children, :qualities
	attr_accessible :notes, :gender, :height, :weight, :origin, :piercing, :tattoo, :vehicle, :japanese_level, :hits, :province_id
	
	validates :user_id,					:uniqueness => true
	validates :name, 						:presence => true
	validates :lastname, 				:presence => true
	validates :birthday,				:presence => true
	validates :marital_status,	:presence => true
	validates :address,					:presence => true
	validates :city,						:presence => true
	validates :phone_number,		:presence => true
	validates :working,					:inclusion => { :in => [true, false] }
	validates :possible_moving, :inclusion => { :in => [true, false] }
	validates :province_id,			:presence => true
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
	belongs_to :province
	
	paginates_per 100

  HUMANIZED_ATTRIBUTES = {
  	:user_id => 'Usuário',
    :name => 'Nome',
    :lastname => 'Sobrenome',
    :address => 'Endereço',
    :city => 'Cidade',
    :phone_number => 'Telefone',
    :marital_status => 'Estado Civil',
    :gender => 'Sexo',
    :working => 'Empregado',
    :possible_moving => 'Possibilidade para mudar',
    :children => 'Filhos',
    :qualities => 'Qualidades',
    :province_id => 'Província',
    :height => 'Altura',
    :weight => 'Peso',
    :origin => 'Descendência',
    :notes => 'Experiências Profissionais',
    :piercing => 'Piercing',
    :tattoo => 'Tatuagem visível',
    :vehicle => 'Carro próprio',
    :japanese_level => 'Nível de entendimento do idioma japonês'
  }
  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
	
	
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
  
  def increment_counter
  	class << self
  		def record_timestamps; false; end
  	end
  	self.increment! :hits
  	class << self
  		remove_method :record_timestamps
  	end
  end
  
end