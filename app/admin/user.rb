ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

index do
  selectable_column
  column :email
  column :account
  column :signed_in_at
  column :last_signed_in_at
  column :admin
  actions
end

form do |f|
  f.semantic_errors
  inputs do
    f.input :account
    input :admin
  end
  f.actions
end

end
