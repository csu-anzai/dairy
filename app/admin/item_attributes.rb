ActiveAdmin.register ItemAttribute do

  menu priority: 2, label: proc { I18n.t("admin.categories.i_a.label") }, parent: 'Categories'
  
  permit_params :name, :active, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :name
      f.input :active
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
