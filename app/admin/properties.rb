ActiveAdmin.register Property do
  filter:property_name
  filter:company
  filter:property_address
  filter:price
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :company_id, :property_name, :property_price, :property_desc, :property_address
  #
  # or
  #
  # permit_params do
  #   permitted = [:company_id, :property_name, :property_price, :property_desc, :property_address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :property_name ,:property_desc,:property_address,:property_price,:company_id,images: []
  form do |f|
    f.inputs :property_name ,:property_desc,:property_address,:property_price,:company_id
    input :images, as: :file, input_html: { multiple: true }
    f.submit
  end

  
end
