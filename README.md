## Ahrlty Development Processes

 - Checkout master and pull new updates
   ````
   git checkout master
   git pull
   ````
 - Checkout a new branch for your new features
   ````
   git checkout -b BRANCH_NAME
   ````
 - Do your work (write tests, make them pass, etc)
 - `git diff`
 - Add the changes you want to make and leave out stuff not relevant to the feature.
 - Commit the changes with a descriptive message.
 - `git push origin head`
 - Make a pull request
 - Mark the card as "finished" in pivotal tracker
 - Get the feedback you need.
 - Merge the pull request
 - Delete the branch
 - Mark the card as "delivered" in pivotal tracker
 - Party
