class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed discover following followers]
  before_action :authorize_user, only: %i[ show feed discover ]

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def authorize_user
      authorize @user
    end
end
