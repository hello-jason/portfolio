namespace :deploy do

  def deploy(env)
    puts "Deploying to #{env}"
    system "bundle exec middleman deploy TARGET=#{env}"
  end

  task :local do
    sh "rm -rf build"
    sh "bundle exec middleman build"
    sh "gulp buildcss"
  end

  task :staging do
    sh "rm -rf build"
    sh "bundle exec middleman build"
    sh "gulp buildcss"
    deploy :staging
  end

  task :production do
    sh "rm -rf build"
    sh "bundle exec middleman build"
    sh "gulp buildcss"
    deploy :production
  end

end
