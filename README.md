# puppet
Steps :

1)Make sure a hostfile entry 'puppet' is created on all machines including puppet server. This should resolve private ip address of puppet server

2)
all puppet agents should be bootstrapped  with puppet agent and should have their certificate signed

3)Fork this repo

4)Make the necessary changes in hieradata/nodes and site.pp

5)On Puppet master :

cd /etc/puppetlabs/code/environments/production

git init

git add *


git commit -am "Initial commit"


Add remote repo as your forked repo

eg: git remote add origin 'https://github.com/sumeshkanayi/puppet.git'  

git pull origin master

puppet module install choria-mcollective_choria --version 0.0.26

6) run below command on all puppet agents (including server)

puppet agent -t

7)ssh to machine which is configured as mcollective client (Hiera/nodes)

7) mco ping

8)mco puppet status

8)run

mco puppet agent runall 5


