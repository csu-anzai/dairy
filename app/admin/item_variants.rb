ActiveAdmin.register ItemVariant do

  menu priority: 2, label: proc { I18n.t("admin.categories.i_v.label") }, parent: 'Products'
  
  permit_params :item_id, :price, :title, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :item_id, as: :select, :prompt => "Ⓘ Select Item", collection: Item.all.collect {|i| [i.name, i.id] }
      f.input :title
      f.input :price
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
