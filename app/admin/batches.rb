ActiveAdmin.register Batch do

  menu priority: 2, label: proc { I18n.t("admin.products.batch.label") }, parent: 'Stock'
  
  permit_params :user_id, :item_variant_id, :code, :manufacturing_date, :expiry_date, :status, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, :prompt => "Select Supplier", collection: Supplier.all.collect {|sup| [sup.name, sup.id] }
      f.input :item_variant_id, as: :select, :prompt => "Select Variant", collection: ItemVariant.all.collect {|i_var| [i_var.price, i_var.id] }
      f.input :code
      f.input :manufacturing_date
      f.input :expiry_date
      f.input :status, as: :select, :prompt => "Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
