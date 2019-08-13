ActiveAdmin.register Page do

  permit_params :headline, :title, :description, :page_type, :active, :created_by, :updated_by

  form do |f|
    f.inputs do
      f.input :headline
      f.input :title
      f.input :page_type
      f.input :description
      f.input :active, as: :select, :prompt => "✔ Select Status", :collection => STATUS
      f.input :created_by, :input_html => { :value => current_admin_user.id }, as: :hidden
      f.input :updated_by, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
  end

end
