Spree::Admin::VariantsController.class_eval do

  def create_all
    @product = Spree::Product.find_by_slug(params[:product_id])
    options = []

    @product.option_types.order(:position).each do |o|
      options << o.option_values.collect(&:id)
    end

    options = SpreeVariantAllOptions::ArrayHelper.array_permutation options

    options.each do |ids|
      v = @product.variants.new
      if ids.kind_of?(Array)
        v.option_value_ids = ids.flatten
      else
        v.option_value_ids = ids
      end
      v.price = @product.price
      v.weight = @product.weight
      v.height = @product.height
      v.width = @product.width
      v.depth = @product.depth
      v.save
    end

    redirect_to admin_product_variants_url(@product)
  end


  def remove_all
    @product = Spree::Product.find_by_slug(params[:product_id])
    all_variants_excluding_master = @product.variants
    all_variants_excluding_master.destroy_all
    redirect_to admin_product_variants_url(@product)
  end

  def vprice_all
=begin    
    @product = Spree::Product.find_by_slug(params[:product_id])
    master_vprices = @product.master.volume_prices

    unless master_vprices.empty?
      @product.variants.each do |variantnm|
        if variantnm.volume_prices.empty?
          master_vprices.each do |vprice|
            variantnm.volume_prices.create! :amount => vprice.amount, :discount_type => vprice.discount_type,
                                           :name => vprice.name, :position => vprice.position , :range => vprice.range
          end
        end
      end
    end
    redirect_to admin_product_variants_url(@product)
=end
    redirect_to admin_product_variants_url(@product)
  end


end
