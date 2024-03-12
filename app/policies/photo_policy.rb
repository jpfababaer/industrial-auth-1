#1 The idea of creating policies is to define the KNOWLEDGE about who can do what with a PHOTO (specifically for this class) inside instance methods within this PhotoPolicy.
class PhotoPolicy

  #1 This is how we set up the PhotoPolicy class. By passing in the "Who" (i.e. user) and the "What" (i.e. photo). The Who is trying to do something with the What and we want to define if they are able to or not.
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  #1 This is where we define what the Who can do with the What. In this PhotoPolicy with action "show", we want to determine which users are able to see the details of a specific photo. To do so, we need to create some Ruby logic that would return true for show?.
  def show? #See the details of a photo if...
    user == photo.owner || #the user is the OWNER of the photo OR...
      !photo.owner.private? || #the OWNER of the photo has their profile set to PUBLIC OR...
      photo.owner.followers.include?(user) #the User (i.e. current_user) is a PART of the OWNER's follower list.
  end
end
