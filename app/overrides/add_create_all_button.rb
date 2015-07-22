Deface::Override.new(
  :virtual_path   => "spree/admin/variants/index",
  :name           => "add_create_all_button",
  :insert_bottom  => "#new_variant",
  :sequence       => 'auth_shared_login_bar',
  :disabled       => false,
  :partial        => "spree/admin/variants/create_all")
