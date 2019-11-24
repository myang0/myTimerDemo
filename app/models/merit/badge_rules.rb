# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # Grant badge to user if they have at least one successful session completed
      grant_on 'records#create', model_name: 'User', badge: 'Rookie!', to: :action_user do |record|
        Record.where(uname: record.uname, success: true).count >= 1
      end

      # Grant badge to user if they have at least 10 successful sessions completed
      grant_on 'records#create', model_name: 'User', badge: 'Intermediate!', to: :action_user do |record|
        Record.where(uname: record.uname, success: true).count >= 10
      end

      # Grant badge to user if they have at least 50 successful sessions completed
      grant_on 'records#create', model_name: 'User', badge: 'Veteran!', to: :action_user do |record|
        Record.where(uname: record.uname, success: true).count >= 50
      end

      # Grant badge to user if they have at least 250 successful sessions completed
      grant_on 'records#create', model_name: 'User', badge: 'Intermediate!', to: :action_user do |record|
        Record.where(uname: record.uname, success: true).count >= 250
      end

      # Grant badge to user if they have a session which is 60 minutes long
      grant_on 'records#create', model_name: 'User', badge: 'Focused!', to: :action_user do |record|
        Record.where(uname: record.uname, success:true, duration: 60).count >= 1
      end

      # Grant badge to user if they have a session which is a minute long
      grant_on 'records#create', model_name: 'User', badge: "...That's it?", to: :action_user do |record|
        Record.where(uname: record.uname, success:true, duration: 1).count >= 1
      end

      # Grant badge to user if they have completed 5 sessions in a row
      grant_on 'records#create', model_name: 'User', badge: "Hot Streak!", to: :action_user do |record|
        Record.order('created_at desc').where(uname: record.uname, success: true).limit(5).count >= 5
      end

      # Grant badge to user if they have completed 10 sessions in a row
      grant_on 'records#create', model_name: 'User', badge: "Hotter Streak!", to: :action_user do |record|
        Record.order('created_at desc').where(uname: record.uname, success: true).limit(10).count >= 10
      end

      # Grant badge to user if they have completed 25 sessions in a row
      grant_on 'records#create', model_name: 'User', badge: "Hottest Streak!", to: :action_user do |record|
        Record.order('created_at desc').where(uname: record.uname, success: true).limit(25).count >= 25
      end

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end
  end
end
