class GroupsController < ApplicationController

	def create
		@current_user = User.find(session[:user_id])

		created_group = Group.create(group_name:params[:org_name], description:params[:description], joined:"true", founder:@current_user.first_name)
		Join.create( user_id:session[:user_id], group_id:created_group.id )
		redirect_to :back
	end


	def join
		@current_user = User.find(session[:user_id])
		@current_group = Group.find(params[:id])

		# find out if current user has not joined group, target the Join table
		existing_member = Join.exists?(user_id:session[:user_id], group_id:params[:id])
		#existing_member = Join.exists?('user_id = ? AND group_id = ?', session[:user_id], params[:id] )

		# if the current user is not the founder and is not a existing member then go to join up page
		if @current_user.first_name != @current_group.founder and existing_member == false
			render 'join_one'
		# if the current user is owner of group or existing member, then go to leave group page
		else
			render 'join_two'
		end

	end


	def join_group
		@current_user = User.find(session[:user_id])
		session[:current_group_id] = @current_user.id
		# work on the 'Join' table first to connect the current user to group to join
		Join.create( user_id:session[:user_id], group_id:params[:id])

		# increase the member count
		Group.find(params[:id]).increment!(:member_count)

		redirect_to '/users/%d' % session[:user_id]
	end

	def leave_group
		# incoming id is the group id
		Join.where(user_id:session[:user_id], group_id:params[:id]).destroy_all
		redirect_to '/users/%d' % session[:user_id]
	end

	def destroy_group
		Group.destroy(params[:id])
		redirect_to :back
	end


end
