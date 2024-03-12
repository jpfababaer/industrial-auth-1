class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  #4 In order to take advantage of the policy helper method, we must define our authorization logic here so we can reference it back in the view templates. 
  def show?
    user == current_user ||
      !user.private? ||
      user.followers.include?(current_user)
  end
end
