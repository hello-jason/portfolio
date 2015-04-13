require "rake"

task :deploy do
  sh "middleman build"
  sh "gulp"
  sh "bundle exec middleman deploy"
end
