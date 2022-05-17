class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all.order('id DESC')
    end
    
    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        if @product.persisted?
            redirect_to products_path, notice: "Nuevo producto creado."
        else
            redirect_to new_product_path, notice: "Lo sentimos, no fue posible crear el producto."
        end
    end

    def show
        @comment = Comment.new(product:@product)
        @comments = @product.comments.order('id DESC')
    end

    def edit
    end

    def update
        if @product.update(product_params)
            redirect_to edit_product_path, notice: "Producto actualizado exitosamente."
        else
            redirect_to new_product_path, notice: "Lo sentimos, no fue posible actualizar el producto."
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
        params.require(:product).permit(:title, :description, :image, category_ids: [] )
    end

end