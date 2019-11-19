class RecordsController < ApplicationController
    def new
        @record = Record.new
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
