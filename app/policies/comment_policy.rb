class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index?
    false
  end

  def show?
    false
  end

  def new?
    false
  end

  def create?
    true
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author
  end

end
