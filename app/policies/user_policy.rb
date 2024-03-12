class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  def nav?
    user == current_user ||
      !user.private? ||
      user.followers.include?(current_user)
  end

  def feed?
    user == current_user
  end

  def discover?
    user == current_user
  end
end
