class ProfilesController < ApplicationController
    def index
        @transactions = current_user.transactions
    end
    
    def edit
    end    
end
