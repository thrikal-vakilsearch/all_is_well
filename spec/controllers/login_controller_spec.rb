require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe LoginController, :type => :controller do

  describe "GET new" do
    before { get :new }
    it { should render_template('new') }
  end

  describe "GET create" do
    before { post :create, email: 'thrillsam@gmail.com', password: 'thrikal' }
    it { should redirect_to(users_path) }
    it { should set_the_flash }
    it { should set_the_flash.to('Logged in successfully')}
  end

  describe "GET destroy" do
    before { get :destroy }
    it { should redirect_to(login_path) }
    it { should set_the_flash }
    it { should set_the_flash.to('Logged out successfully')}
  end
end
