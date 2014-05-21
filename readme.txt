Steve Avery 997694781
Gregory Guterman 999388422

===HOWTO:
Type a few characters into the search box (upper right) and hit enter to see a list of suggestions. Select one or more to see its relative popularity in the main graph window.

Move your mouse over the graph window to control the speed of the animation. Move left to go back in time, right to go forward.

Show different normalization graphs by clicking a radio button in the bottom right.

Finally, play with the different data parameters (questions, answers, ...) to see different aspects of the tag popularity.


===ABOUT:
Greg and I have worked hard over the last week to finish up our project.

Our visualization shows the activity progression over time, of all entities related to posts categorized by the tags on those posts.

In the main window, the graph shows the sum of (selected) activity parameters for that day, for that tag, scaled to 100 by the maximum value of the activity of the selected tags. 

We implemented a new view in the visualization, representing a normalizing scale of the data presented below it. This view shows how the entire site has grown in popularity over the time in our dataset, and gives the user the chance to compare the relative popularity of the tags of interest with the popularity of the site.

In this way, the user can divine whether the points are especially meaningful, eg if there are minima when the site is more popular, or vice versa.

I was able to determine three independent ways of measuring site popularity, and we felt that each would be interesting to the user.

The first is by counting total unique active users per day. The second was to count new user registrations per day. Finally, the third method was to amortize the view count of each post through the remainder of the dataset, as a crude measure of the total views per day the site accrues.

Additionally, we were able to introduce a new feature that allows the user to control which parameters to use in the scoring of the tag popularity. There were six parameters that could be matched up to a specific date.
- Questions have a creation date
- Accepted answers have a creation date
- Votes, including upvotes, downvotes, and favorites (among others) all have creation dates
- Comments have creation dates

Other aspects of the data have no date attached to them, and so could not be included in this visualization. In fact the dataset could be improved in many ways, certainly linking unaccepted answers to questions would be helpful, as would linking userids to posthistory columns.

By checking and unchecking the corresponding controls in the UI, the user has the ability to see questions asked, for example, 
as the only measure for popularity, instead of using all the metrics.

Focusing more on the processing side, Greg was able to leverage the controlP5 library to create a user interface, and to harness it to control the links in our dataset. We ran into a lot of problems here, and actually had to recompile the library several times to add in some methods that we needed.

In the end, we were struggling to finish everything, and many ideas we had did not make it into the final submission. While we did spend many hours on this project, it would have improved with many more.