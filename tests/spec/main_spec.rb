require 'serverspec'

set :backend, :exec


describe package('zsh') do
  it { should be_installed }
end

describe file('/home/mtester/.zprezto') do
  it { should be_directory }
end

describe file('/home/mtester/.zlogin') do
  it { should be_file }
  its(:content) { should contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zlogout') do
  it { should be_file }
  its(:content) { should contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zpreztorc') do
  it { should be_file }
  its(:content) { should contain /# Ansible managed:/ }
  its(:content) { should contain /prezto:load/ }
end

describe file('/home/mtester/.zprofile') do
  it { should be_file }
  its(:content) { should contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zshenv') do
  it { should be_file }
  its(:content) { should contain /# Ansible managed:/ }
end

describe file('/home/mtester/.zshrc') do
  its(:content) { should contain '.zprezto/init.zsh' }
end
