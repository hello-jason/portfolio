namespace :deploy do

  def deploy(env)
    puts "Deploying to #{env}"
    system "TARGET=#{env} bundle exec middleman deploy"
  end

  task :local do
    sh "bundle exec middleman build"
    sh "npm run buildcss"
  end

  task :staging do
    sh "bundle exec middleman build"
    sh "npm run buildcss"
    deploy :staging
  end

  task :production do
    sh "bundle exec middleman build"
    sh "npm run buildcss"
    deploy :production
  end

end
