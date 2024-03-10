# industrial-auth-1

Target: https://industrial-auth-1.matchthetarget.com/

FLOW:

1. Here are the to-do list that needs to be addressed and fixed in this project:
  A. A user that does NOT own the photo should be redirected back to the same page when clicking on a delete button for a photo. Should hide the link for the delete button in this scenario.

  B. Same should go for edit on a photo.

  C. Same should be considered for deleting a comment that is not OWNED by the current_user. 

  D. Same should go for the edit on a comment. 

  E. For private accounts, the visiting user should only be able to see the FOLLOWING: followers and leaders. 

  F. For private accounts, the POSTS and like section should not be shown unless the viewing user is an accepted follower.

  G. If it's a public account then anyone can view their posts and likes even if they are not a follower of the public user account. 

  H. Only a user should be able to see their own pending follow requests

  -I. The collections of photos that a user sees through their leaders (feed/discover) should only be viewable by them. 

2. Using except and only -> routes.rb
