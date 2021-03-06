class RecordsController < ApplicationController
    def new
        @record = Record.new
    end

    def index
        t = Time.now.midnight + 1.day

        # All records from today to a year ago
        if request.fullpath == '/stats/year'
            @successes = Record.group_by_month_of_year(:created_at, reverse: false).where(uname: session[:user_name],
                                                                                 created_at: (t - 365.day)..t,
                                                                                 success: true).sum(:duration)

            @failures = Record.group_by_month_of_year(:created_at, reverse: false).where(uname: session[:user_name],
                                                                                created_at: (t - 365.day)..t,
                                                                                success: false).sum(:duration)
        # All records from today to a month ago
        elsif request.fullpath == '/stats/month'
            @successes = Record.group_by_day_of_month(:created_at, reverse: false).where(uname: session[:user_name],
                                                                               created_at: (t - 30.day)..t,
                                                                               success: true).sum(:duration)

            @failures = Record.group_by_day_of_month(:created_at, reverse: false).where(uname: session[:user_name],
                                                                              created_at: (t - 30.day)..t,
                                                                              success: false).sum(:duration)
        # All records from today to a week ago
        elsif request.fullpath == '/stats/week'
            @successes = Record.group_by_day_of_week(:created_at, reverse: false).where(uname: session[:user_name], 
                                                                               created_at: (t - 7.day)..t,
                                                                               success: true).sum(:duration)

            @failures = Record.group_by_day_of_week(:created_at, reverse: false).where(uname: session[:user_name], 
                                                                              created_at: (t - 7.day)..t,
                                                                              success: false).sum(:duration)

        # All records from today
        elsif request.fullpath == '/stats/day'
            @successes = Record.group_by_hour_of_day(:created_at, reverse: false).where(uname: session[:user_name],
                                                                                created_at: (t - 1.day)..t,
                                                                                success: true).sum(:duration)

            @failures = Record.group_by_hour_of_day(:created_at, reverse: false).where(uname: session[:user_name],
                                                                               created_at: (t - 1.day)..t,
                                                                               success: false).sum(:duration)
        # Default to all records from today to a week ago
        else
            @successes = Record.group_by_day_of_week(:created_at, reverse: false).where(uname: session[:user_name], 
                                                                               created_at: (t - 7.day)..t,
                                                                               success: true).sum(:duration)
                                                              
            @failures = Record.group_by_day_of_week(:created_at, reverse: false).where(uname: session[:user_name], 
                                                                              created_at: (t - 7.day)..t,
                                                                              success: false).sum(:duration)
        end

    end

    def create
        @record = Record.new(record_params)
        if @record.save
            redirect_to '/timer'
        else
            redirect_to '/'
        end
    end

    private
    def record_params
        params.require(:record).permit(:uname, :duration, :date, :success)
    end
end