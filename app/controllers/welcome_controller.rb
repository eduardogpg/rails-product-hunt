class WelcomeController < ApplicationController

    def index
        return redirect_to products_path, notice:'Example'
    end

end