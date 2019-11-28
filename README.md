# README

myTimer

This is a simple productivity web application.

The general user experience involves a user logging in, and choosing one of 4 options.  The first being to set a timer,
the second being to set and view goals, the third being to view statistics, and the fourth being to view achievements.

The timer feature allows the user to set a specified time, and the timer will tick down, until it reaches 0. Upon
reaching 0, a record of the user's username, and the duration of the session will be inserted into the database.
Additionally, on this page, the user can also view their goals that they have set for themselves, and discard them
if necessary, i.e., if they are finished.

The goals feature allows the user to add, edit, and delete goals.  All goals will be displayed on the goals page.  When
considering a goal, a user will be able to set a title, category, and description for the goal.  

The statistics feature simply fetches all the records of sessions that a user is responsible for, and displays them all
in bar chart form.  The user will be able to sort the data in various ways, such as for the past day, past week, past
month, or past year.

Finally, the achievements feature grants the user various achievements upon completing certain tasks.  Some tasks may
include successfully completing a certain number of sessions, or succesfully completing a certain number of consecutive
sessions without fail.  On the achievements page, the user will be able to view all the achievements that they already
have, and may be able to get hints for the achievements which they do not yet have.