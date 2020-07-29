class Member::MembersController < ApplicationController
  before_action :authenticate_member!
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
      redirect_to member_member_path
    else
      flash[:notice] = "error"
      render :edit
      end
    end
    def deactivate
    	@member = Member.find(params[:id])
    end
    def hide
        @member = Member.find(params[:id])
        @member.update(is_deleted: false)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
	private
    def member_params
      params.require(:member).permit(
                                    :first_name,
                                    :last_name, :first_name_phonetic,
                                    :last_name_phonetic,
                                    :telephone_number,
                                    :postcode,
                                    :address,
                                    :is_deleted)
    end
end
