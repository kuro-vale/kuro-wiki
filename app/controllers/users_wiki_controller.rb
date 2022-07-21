# frozen_string_literal: true

# Controller to get wikis by user
class UsersWikiController < ApplicationController
  # GET /wiki/:username
  def index
    @user = User.find_by(username: params[:username])
    @wikis = Wiki.where("user_id = #{@user.id}").order(created_at: :DESC).page(params[:page])
  end
end
