task :default => :update

desc "Update the web site"
task :update do |t|
  sh "git checkout master"
  sh "rake doc api"
  sh "git checkout gh-pages"
  sh "rm -r api && mv doc/* . && rm -r doc"
  sh "git add ."
  sh "git commit -m 'updated web site'"
end
