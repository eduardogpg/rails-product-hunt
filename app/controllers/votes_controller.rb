class VotesController < ApplicationController
    before_action :set_votable, only: [:create]
    
    def create
        Vote.create votable:@votable
        respond_to do |format|
            format.json { render partial:'votes/success' }
        end
    end

    private

    def set_votable
        @votable = Product.find_by slug:params[:product_id] if params.has_key? :product_id
    end
end
