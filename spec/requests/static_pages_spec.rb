#encoding: utf-8
require 'spec_helper'

describe "StaticPages" do

  subject { page } 
  let(:base_title) { "ShigotoDoko" }

  describe "Home Page" do
    before(:each) { visit home_path }
    it "should have the content 'O maior e mais popular sistema de empregos'" do
      should have_content('O maior e mais popular sistema de empregos')
    end
    it "should have the right title" do
      should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  describe "Help page" do
    before(:each) { visit help_path }
    it "should have the content 'Precisando de Ajuda'" do
      should have_content("Precisando de Ajuda")
    end
    it "should have the right title" do
      should have_selector('title', :text => "#{base_title} | Ajuda")
    end
  end

  describe "About page" do
    before(:each) { visit about_path }
    it "should have the content 'Sobre' " do
      should have_selector('h1', :text => "Sobre")
    end
    it "should have the right title" do
      should have_selector('title', :text => "#{base_title} | Sobre")
    end
  end 

  describe "Contact page" do
    before(:each) { visit contact_path }
    it "should have the content 'Contato' " do
      should have_selector('h1', :text => "Contato")
    end
    it "should have the right title" do
      should have_selector('title', :text => "#{base_title} | Contato")
    end
  end
end
