# Overwriting the Thor's default source path
module Thor::Actions
  def source_paths
    [File.dirname(__FILE__) + '/templates']
  end
end

# Removing useless files
remove_file 'public/index.html'
remove_file 'app/assets/images/rails.png'

# Copying templates files
copy_file 'Gemfile', 'Gemfile', force: true
copy_file 'gitignore', '.gitignore', force: true

# Gemfile's dependencies verification
system 'bundle install'

# Git repository initialization
system 'git init'
system 'git add .'
system "git commit -am 'Initial Rails directory structure'"
