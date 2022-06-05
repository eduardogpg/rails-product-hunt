class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        # @products = Product.all.order('id DESC')
        page = params[:page] ||= 1
        @products = Product.paginate(page:page, per_page:10).order('id DESC')
    end
    
    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        
        respond_to do |format|
            if @product.persisted?
                redirect_to products_path, notice: "Nuevo producto creado."
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def create_two
        @product = Product.create(product_params)
        if @product.persisted?
            redirect_to products_path, notice: "Nuevo producto creado."
        else
            redirect_to new_product_path, notice: "Lo sentimos, no fue posible crear el producto."
        end
    end

    def show
        @comment = Comment.new
        @comments = @product.comments.order('id DESC')
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to @product, notice: "Producto actualizado exitosamente."
        else
            redirect_to @product, notice: "Lo sentimos, no fue posible actualizar el producto."
        end
    end

    def destroy
        @product.destroy
        redirect_to products_path, notice: "Producto eliminado exitosamente."
    end

    def search  
        @q = params[:q]
        @products = Product.where("title like ?", "%#{@q}%")
    end

    private

    def set_product
        @product = Product.friendly.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:title, :description, :image, :url, category_ids: [] )
    end

end
