require 'test_helper'

class Admin::GenresControllerTest < ActionDispatch::IntegrationTest
	 test "should get index" do
    	get admins_genres_path
    	
  end
end
