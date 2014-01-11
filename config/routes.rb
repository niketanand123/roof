Roof::Application.routes.draw do
  resources :sales_taxes

  resources :job_estimates

  resources :job_estimate_statuses

  resources :vendors

  resources :assembly_items

  resources :job_costings

  resources :job_documents

  resources :job_contacts

  resources :contact_types

  resources :job_change_orders

  resources :job_tasks

  resources :task_types

  resources :job_call_notes

  resources :job_estimate_items

  resources :item_codes

  resources :assemblies

  resources :job_details

  resources :estimate_types

  resources :employees

  resources :product_colors

  resources :product_types

  resources :roof_types

  resources :service_types

  resources :job_statuses

  resources :job_sites

  resources :lead_sources

  resources :customer_types

  resources :companies

  resources :customers

  resources :unit_of_measurements

  resources :customers do
    resources :job_sites do
      resources :job_estimates
    end
  end

  resources :job_estimates do
    resources :job_estimate_items
  end

  resources :customers do
    resources :job_sites do
      resources :job_call_notes
    end
  end
  resources :customers do
    resources :job_sites do
      resources :job_tasks
    end
  end
  resources :customers do
    resources :job_sites do
      resources :job_change_orders
    end
  end
  resources :customers do
    resources :job_sites do
      resources :job_contacts
    end
  end
  resources :customers do
    resources :job_sites do
      resources :job_documents
    end
  end
  resources :customers do
    resources :job_sites do
      resources :job_costings
    end
  end

  resources :job_sites do
    resources :job_estimates
  end
  resources :assemblies do
    resources :assembly_items
  end
  resources :job_estimates do
    resources :job_estimate_items
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'customers_search' => 'customers#index'
  get 'task_viewer' => 'job_tasks#index_all'
  get 'populate_item_code' => 'assembly_items#populate_item_code'
  get 'populate_estimate' => 'job_estimate_items#populate_estimate'
  get 'populate_company' => 'customers#populate_company'

  get 'job_lead_sheet' => 'job_sites#job_lead_sheet'
  get 'job_estimate_pdf' => 'job_sites#job_estimate_pdf'
  get 'job_proposal' => 'job_sites#job_proposal'
  get 'delete_estimate_item' => 'job_estimates#delete_estimate_item'
  get 'update_estimate_item' => 'job_estimates#update_estimate_item'
  post 'add_items' => 'job_estimates#add_items'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
