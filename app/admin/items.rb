ActiveAdmin.register Item do

  menu priority: 4, label: proc { I18n.t("admin.products.item.label") }, parent: 'Categories'
  
  permit_params :item_category_id, :name, :active, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :item_category_id, as: :select, :prompt => "Select Item Category", collection: ItemCategory.all.collect {|i_c| [i_c.name, i_c.id] }
      f.input :name
      f.input :active
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
