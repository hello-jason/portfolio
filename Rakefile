namespace :deploy do

  def deploy(env)
    puts "Deploying to #{env}"
    system "TARGET=#{env} bundle exec middleman deploy"
  end

  task :local do
    system "rm -rf build"
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
  end

  task :staging do
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
    deploy :staging
  end

  task :production do
    system "rm -rf build"
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
    deploy :production
  end

  task :test do
    system "rm -rf build"
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
    system "TARGET=staging bundle exec middleman deploy"
  end

end
