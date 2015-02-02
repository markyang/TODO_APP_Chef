include_recipe 'git'
include_recipe 'nodejs'
user 'random' do
  supports :manage_home => true
  home '/home/random'
end

nodejs_npm 'forever'

git '/home/random/TODO' do
  repository 'https://github.com/markyang/TODO_APP.git'
  user 'random'
end

nodejs_npm '' do
  path '/home/random/TODO'
  user 'random'
end

execute 'forever start server.js' do
  cwd '/home/random/TODO'
  user 'root'
end
