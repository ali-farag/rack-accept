task :default => :update

desc "Update the docs"
task :update do |t|
  sh "git checkout master"
  sh "rake doc api"
  sh "git checkout gh-pages"
  sh "mv doc/* . && rm -r doc"
  sh "git add ."
  sh "git commit -m 'updated web site'"
end
