ActiveAdmin.register Stock do

  menu priority: 2, label: proc { I18n.t("admin.products.stock.label") }, parent: 'Stocks'
  
  permit_params :batch_id, :unit_id, :quantity, :active, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :batch_id, as: :select, :prompt => "Select Batch", collection: Batch.all.collect {|b| [b.code, b.id] }
      f.input :unit_id, as: :select, :prompt => "Select Unit", collection: Unit.all.collect {|u| [u.name, u.id] }
      f.input :quantity
      f.input :active
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
