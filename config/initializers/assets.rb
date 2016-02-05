# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( vendor/assets/components/angular-resource/angular-resource.js )
Rails.application.config.assets.precompile += %w( vendor/assets/components/components/angular/angular.js )
Rails.application.config.assets.precompile += %w( vendor/assets/components/lodash/dist/lodash.js )
Rails.application.config.assets.precompile += %w( vendor/assets/components/angular-google-maps/dist/angular-google-maps.js )
Rails.application.config.assets.precompile += %w( vendor/assets/components/angular-masonry/angular-masonry.js )
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

Rails.application.config.assets.precompile += %w( admin.css )

Rails.application.config.assets.precompile += %w( vendor/assets/components/lodash/dist/lodash.js )
Rails.application.config.assets.precompile += %w( vendor/assets/angular/controllers/app.js )
Rails.application.config.assets.precompile += %w( vendor/assets/angular/directives/directives.js )
Rails.application.config.assets.precompile += %w( vendor/assets/angular/controllers/controllers.js )
Rails.application.config.assets.precompile += %w( vendor/assets/angular/filters/filters.js )
Rails.application.config.assets.precompile += %w( vendor/assets/angular/services/services.js )



Rails.application.config.assets.precompile += %w( dashboard.css )
Rails.application.config.assets.precompile += %w( catalogs.css )
Rails.application.config.assets.precompile += %w( categories.css )
Rails.application.config.assets.precompile += %w( items.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( site.css )
Rails.application.config.assets.precompile += %w( galleries.css )
Rails.application.config.assets.precompile += %w( albums.css )
Rails.application.config.assets.precompile += %w( photos.css )
