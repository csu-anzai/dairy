ActiveAdmin.register Location do

  # menu priority: 1, label: proc { I18n.t("admin.products.location.label") }, parent: 'Stock'
  
  permit_params :vendor_id, :delivery_executive_id, :name, :start_point, :end_point, :latitude, :longitude, :status, :description, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :vendor_id, as: :select, :prompt => " ☻Ⓥ Select Vendor", collection: Vendor.all.collect {|ven| [" ☻ #{ven.name} , ☎ #{ven.mobile}", ven.id] }
      f.input :delivery_executive_id, as: :select, :prompt => "☻ Select Delivery Executive", collection: DeliveryExecutive.all.collect {|d_exe| [" ☻ #{d_exe.name} , ☎ #{d_exe.mobile}", d_exe.id] }
      f.input :name
      f.input :start_point
      f.input :end_point
      f.input :latitude
      f.input :longitude
      f.input :status, as: :select, :prompt => "✔ Select Status", :collection => STATUS
      f.input :description
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end
  
end
