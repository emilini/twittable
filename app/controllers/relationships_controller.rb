class RelationshipsController < ApplicationController

  def create
    @friend = User.find(params[:friend_id])
    @relationship = current_user.relationships.build(friend_id: @friend.id)

      if @relationship.save
        flash[:notice] = "You're now following #{@friend.username}"
        redict_to profile_path(@friend.id)
      else
        flash[:notice] = "something went wrong, try again please!"
        redict_to profile_path(@friend.id)
      end
    #  if
  end
# create

private

  def relationship_params
    params.require(:relationship).permit(:user_id, :friend_id)

  end
# relationship params


end
# class