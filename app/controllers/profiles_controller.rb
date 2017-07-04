class ProfilesController < ApplicationController
    def index
        @transactions = current_user.transactions.limit(3)
    end
    
    def edit
    end    
end
