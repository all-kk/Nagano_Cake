class Admins::MembersController < ApplicationController
  before_action :authenticate_admin!
	def index
	  @members = Member.page(params[:page])
	end
	def show
	  @member = Member.find(params[:id])
	end
	def edit
	  @member = Member.find(params[:id])
	end
	def update
      @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "successfully update user!"
      redirect_to admins_members_path
    else
      flash[:notice] = "error"
      render :edit
      end
    end

    private
    def member_params
      params.require(:member).permit(
                                    :first_name,
                                    :last_name,
                                    :first_name_phonetic,
                                    :last_name_phonetic,
                                    :telephone_number,
                                    :postcode,
                                    :address,
                                    :is_deleted)
    end
end
