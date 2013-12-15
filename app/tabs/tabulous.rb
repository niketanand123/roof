Tabulous.setup do

  tabs do

    client_tab do
      text          { 'Client' }
      link_path     { root_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { a_subtab_is_active }
    end

    customers_subtab do
      text          { 'Customer' }
      link_path     { root_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('customers') }
    end

    job_sites_subtab do
      text          { 'Job Site' }
      link_path     { job_sites_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('job_sites') }
    end

    job_estimate_subtab do
      text          { 'Job Estimate' }
      link_path     { job_estimates_path }
      visible_when  { false }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('job_estimates') }
    end

    job_call_note_subtab do
      text          { 'Job Call Notes' }
      link_path     { job_call_notes_path }
      visible_when  { false }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('job_call_notes') }
    end

    job_task_subtab do
      text          { 'Job Tasks' }
      link_path     { job_tasks_path }
      visible_when  { false }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('job_tasks') }
    end

    job_change_order_subtab do
      text          { 'Job Change Order' }
      link_path     { job_change_orders_path }
      visible_when  { false }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('job_change_orders') }
    end

    client_admin_tab do
      text          { 'Client Admin' }
      link_path     { employees_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { a_subtab_is_active }
    end

    employee_subtab do
      text          { 'Employee' }
      link_path     { employees_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('employees') }
    end

    lead_sources_subtab do
      text          { 'Lead Sources' }
      link_path     { lead_sources_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('lead_sources') }
    end

    customer_types_subtab do
      text          { 'Customer Types' }
      link_path     { customer_types_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('customer_types') }
    end

    companies_subtab do
      text          { 'Companies' }
      link_path     { companies_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('companies') }
    end

    job_admin_tab do
      text          { 'Job Admin' }
      link_path     { job_statuses_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { a_subtab_is_active }
    end

    job_status_subtab do
      text          { 'Job Statuses' }
      link_path     { job_statuses_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('job_statuses') }
    end

    job_service_type_subtab do
      text          { 'Service Types' }
      link_path     { service_types_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('service_types') }
    end

    job_roof_type_subtab do
      text          { 'Roof Types' }
      link_path     { roof_types_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('roof_types') }
    end

    job_product_type_subtab do
      text          { 'Product Types' }
      link_path     { product_types_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('product_types') }
    end

    job_product_color_subtab do
      text          { 'Product Colors' }
      link_path     { product_colors_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('product_colors') }
    end

    job_item_code_subtab do
      text          { 'Item Codes' }
      link_path     { item_codes_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('item_codes') }
    end

    job_estimate_type_subtab do
      text          { 'Estimate Type' }
      link_path     { estimate_types_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('estimate_types') }
    end

    job_task_type_subtab do
      text          { 'Task Type' }
      link_path     { task_types_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('task_types') }
    end
  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, or :bootstrap_pill
    # or create your own renderer class and reference it here
    # renderer :default

    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#336699'
    text_color '#444'
    active_tab_color '#fff'
    hover_tab_color '#ddd'
    inactive_tab_color '#aaa'
    inactive_text_color '#888'
  end

end
