class PagesController < ApplicationController

    def home
    end

    def about
    end

    #ajax functionality

    def ajax_request
        render json: { message: 'Hello from the server!' }
    end


end
