module Admin
    class ProductsController < Admin::BaseController
        before_action :set_product, only: %i[ show edit update destroy ]
      
        # GET /products or /products.json
        def index
          @products = Product.all
        end
      
        # GET /products/1 or /products/1.json
        def show
        end
      
        # GET /products/new
        def new
          @product = Product.new
        end
      
        # GET /products/1/edit
        def edit
        end
      
        # POST /products or /products.json
        def create
          @product = Product.new(product_params)
      
          respond_to do |format|
            if @product.save
              format.html { redirect_to admin_product_path(@product), notice: "Product was successfully created." }
              
            else
              format.html { render :new}
              
            end
          end
        end
      
        # PATCH/PUT /products/1 or /products/1.json
        def update
          respond_to do |format|
            if @product.update(product_params)
              format.html { redirect_to admin_product_path(@product), notice: "Product was successfully updated." }
              
            else
              format.html { render :edit }
              
            end
          end
        end
      
        # DELETE /products/1 or /products/1.json
        def destroy
          @product.destroy
          respond_to do |format|
            format.html { redirect_to admin_products_url, notice: "Product was successfully destroyed." }
            
          end
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_product
            @product = Product.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def product_params
            params.require(:product).permit(:name, :quantity, :price)
          end
      end
      
end