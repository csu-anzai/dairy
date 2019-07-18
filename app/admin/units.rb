ActiveAdmin.register Unit do

  menu priority: 3, label: proc { I18n.t("admin.products.unit.label") }, parent: 'Products'
  
  permit_params :name, :code, :active, :created_by, :updated_by
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :code
      f.input :active
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
