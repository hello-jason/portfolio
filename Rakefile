namespace :deploy do
  
  def deploy(env)
    puts "Deploying to #{env}"
    system "TARGET=#{env} bundle exec middleman deploy"
  end

  task :local do
    sh "middleman build"
    sh "gulp buildcss"
  end

  task :staging do
    sh "middleman build"
    sh "gulp buildcss"
    deploy :staging
  end

  task :production do
    sh "middleman build"
    sh "gulp buildcss"
    deploy :production
  end

end
