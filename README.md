# industrial-auth-1

Target: https://industrial-auth-1.matchthetarget.com/

NOTES: 

1. Create a policy folder and within it define a policy for Photo. We will have to create multiple policies depending on the # of controllers we have. photo_policy.rb 

2. Setting up flash message errors when a user isn't authorized to do a specific action. photos_controller.rb + application_controller.rb

3. Calling on Pundit so we can use the helper methods within the gem. application_controller.rb photo_contorller.rb
  
  -Authorize helper. We need to pass in an instance of a Class. (in this case, @photo). What does authorize do?

   a. it assumes there is a class called PhotoPolicy in app/policies.
   b. it assumes there is a method called current_user.
   c. it passes current_user as the first argument and whatever you pass to authorize as the second argument to a new instance of PhotoPolicy. 
   d. it calls a method named after the action with a "?" appended on the new policy instance.
   e. if it gets back false, it raises Pundit::NotAuthorizedError. 

4. Using policy helper methods to make it easier to conditionally hide and show things in our view templates. user_policy.rb + user/show.html.erb
