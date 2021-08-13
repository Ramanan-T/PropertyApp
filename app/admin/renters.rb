ActiveAdmin.register Renter do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

index do
  selectable_column
  column :id
  column :name
  column :email
  column :phone
  actions

  end
  
  permit_params :name,:email,:phone,:password,:password_confirmation

  form do |f|
    f.inputs :name,:email,:phone,:password,:password_confirmation
   actions
  end
end
