class FavoritesController < ApplicationController
 before_filter :require_user_logged_in

 def create
   @micropost = Micropost.find(params[:micropost_id])
   @favorite = current_user.favorites.build(micropost_id: @micropost.id)

   if @favorite.save
     redirect_back(fallback_location: root_url, notice: "お気に入りに登録しました")
   else
     redirect_back(fallback_location: root_url, alert: "お気に入りに登録できません")
   end
 end
 
  def destroy
    @favorite = current_user.favorites.find_by(micropost_id: params[:micropost_id])
    if @favorite && @favorite.destroy
      redirect_back(fallback_location: root_url, notice: "お気に入りを削除しました")
    else
      redirect_back(fallback_location: root_url, alert: "お気に入りを削除できません")
    end
  end
end
