Jeffreyatw::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  match "resume" => redirect("http://docs.google.com/View?id=dfjgtf36_23ckhfhths&hgd=1")

  match "noisegate" => "welcome#noisegate"

  match "atom(.:format)" => redirect("/car/rss.xml")
  match "characters.shtml" => redirect("/car/characters")
  match "feed" => redirect("/blog/feed/")

  match "underwater" => "welcome#underwater"

  legacy_dirs = ['28', 'Scripts', 'bob', 'bus', 'cgi', 'comics', 'css',
               'davegetz', 'deadwinter', 'draggy', 'drawings', 'evidence',
               'evildavis', 'facebook', 'ff', 'food', 'gailmuldrow', 'gordon',
               'groza', 'holocaust', 'images', 'js', 'ld', 'mario', 'media',
               'mid', 'midgarswamp', 'movies', 'mt', 'music', 'newsidebar',
               'pants', 'photos', 'phpMyAdmin', 'professional', 'punks',
               'r', 'rpgcomics', 'sa', 'saddam', 'sidebar', 'sillybaby',
               'sm', 'sophie', 'store', 'tane', 'temp', 'v10', 'v11', 'v12',
               'v3', 'v5', 'v6', 'v7', 'v8', 'v9', 'webcam']

  legacy_dirs.each do |legacy_dir|
    match "#{legacy_dir}(/:path(.:format))" => redirect {|params, req| "/static/#{legacy_dir}/#{params[:path]}.#{params[:format]}" }
  end

  legacy_files = ['Library.html', 'about.gif', 'about.shtml',
                  'about_shadow.gif', 'archive.html', 'art.gif',
                  'art_shadow.gif', 'atom.xml', 'bg.jpg', 'bio.html',
                  'carbottom.html', 'carbottom_old.html', 'cartest.shtml',
                  'cartop.html', 'cartop_old.html', 'characters_old.shtml',
                  'ck_yourmom.jpg', 'comic.html', 'comics.gif',
                  'comics.shtml', 'comics_shadow.gif', 'contact.gif',
                  'contact_shadow.gif', 'ddr_sims.gif', 'ddr_sims.shtml',
                  'ddr_sims_shadow.gif', 'dropboard.swf', 'fanart.shtml',
                  'finalproject.html', 'finalproject.swf', 'foaf.rdf',
                  'footer.html', 'header.html', 'include.js', 'index.html',
                  'index.php', 'index.rdf', 'index.xml', 'index_old.shtml',
                  'index_v1.shtml', 'index_v2.shtml', 'index_v3.shtml',
                  'index_v4.shtml', 'index_v5.shtml', 'index_v6.shtml',
                  'ipod.html', 'kek.txt', 'legholestraws.txt', 'line.gif',
                  'links.shtml', 'links.shtml', 'lj_logo.fla', 'lj_logo.swf',
                  'lj_member.pdf', 'midi.shtml', 'misc.shtml', 'morlon.gif',
                  'morlon.html', 'mythoughtsexactly.txt',
                  'nav-commenters.gif', 'not_jeffrey.html', 'nutshell.txt',
                  'pants.html', 'paul.html', 'paul.swf', 'polaroid.mov',
                  'porterpamphlet.odg', 'porterpamphlet.pdf', 'saltykong.txt',
                  'slug_lj.doc', 'slug_lj.pdf', 'style.css',
                  'styles-site.css', 'styles.css', 'taka_death.html',
                  'temp.txt', 'test.html', 'thesis.pdf', 'thisisafungame.txt',
                  'too_many_eggs.jpg', 'unbendablegirder.txt', 'v5style.css',
                  'v6_blogindex.html', 'v6_bright.html', 'v6_brtop.html',
                  'v6_footer.html', 'v6_header.html', 'v6_top.html',
                  'v6style.css', 'v7_bottom.txt', 'v7_top.txt', 'webcams.gif',
                  'webcams_shadow.gif', 'whenmakefint.txt']

  legacy_files.each do |legacy_file|
    match "#{legacy_file}" => redirect("/static/#{legacy_file}")
  end

  get "portfolio" => "portfolio#index"

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
