namespace :deploy do

  # Deploy to environment function
  def deploy(env)
    puts "Deploying to #{env}"
    system "TARGET=#{env} bundle exec middleman deploy"
  end

  # Rake tasks
  # Usage: bundle exec rake deploy:taskname
  task :local do
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
  end

  task :staging do
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
    deploy :staging
  end

  task :production do
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
    deploy :production
  end

end
