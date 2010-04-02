task :default => :update

desc "Update the docs"
task :update do |t|
  sh "git checkout master"
  sh "rake doc api"
  sh "git checkout gh-pages"
  #sh "git commit -m 'updated web site'"
end
