ActiveAdmin.register AttributeChoice do

  menu priority: 3, label: proc { I18n.t("admin.products.a_c.label") }, parent: 'Categories'
  
  permit_params :item_attribute_id,  :name, :active, :created_by, :updated_by
  
  form do |f|
    f.inputs do
      f.input :item_attribute_id, as: :select, :prompt => "Select Attribute", collection: ItemAttribute.all.collect {|i_atr| [i_atr.name, i_atr.id] }
      f.input :name
      f.input :active, as: :select, :prompt => "Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
