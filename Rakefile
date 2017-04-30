namespace :deploy do
  #=====================================================
  # Functions
  #=====================================================
  # Deploy to environment function
  def deploy(env)
    puts "Deploying to #{env}"
    system "TARGET=#{env} bundle exec middleman deploy"
  end # deploy

  # Build the site
  def buildSite
    system "bundle exec middleman build"
    system "./node_modules/gulp/bin/gulp.js buildcss"
  end # buildSite

  #=====================================================
  # Rake tasks
  # Usage: bundle exec rake deploy:taskname
  #=====================================================
  # Deploy locally
  task :local do
    buildSite
  end # local

  # Deploy to staging
  task :staging do
    buildSite
    deploy :staging
  end # staging

  # Deploy to production
  task :production do
    buildSite
    STDOUT.puts "Deploying to #{env}. Are you sure? (yes/no)"
    input = STDIN.gets.strip
    if input == 'yes'
      deploy :production
    else
      STDOUT.puts "Aborting..."
    end
  end # production

end # namespace
