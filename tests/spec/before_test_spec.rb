require 'serverspec'

set :backend, :exec

describe package('zsh') do
  it { should be_installed }
end

describe file('/home/mtester/.zprezto') do
  it { should_not be_directory }
end

describe file('/home/mtester/.zlogin') do
  it { should_not be_file }
  its(:content) { should_not contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zlogout') do
  it { should_not be_file }
  its(:content) { should_not contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zpreztorc') do
  it { should_not be_file }
  its(:content) { should_not contain /zstyle ':prezto:load' module/ }
  its(:content) { should_not contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zprofile') do
  it { should_not be_file }
  its(:content) { should_not contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zshenv') do
  it { should_not be_file }
  its(:content) { should_not contain /# Ansible managed:/ }
end

describe user('mtester') do
  it { should have_home_directory '/home/mtester' }
end

describe user('mtester') do
  it { should have_login_shell '/bin/bash' }
end
