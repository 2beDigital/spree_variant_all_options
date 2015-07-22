Deface::Override.new(
  :virtual_path   => "spree/admin/variants/index",
  :name           => "add_create_all_button",
  :replace        => 'erb[loud]:contains("button_link_to(Spree.t(:new_variant)")',
  :disabled       => false,
  :partial        => "spree/admin/variants/create_all")
