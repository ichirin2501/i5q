role :server, 'isu5q-01.asia-east1-a.ichirin-mikomiko'

#set :current_path, "/home/isucon/webapp"
#default_run_options[:pty] = true

desc "deploy"
task :deploy, :roles => :server do
    run 'sudo su - isucon sh -c "cd ~/webapp && git pull && cd perl && carton install" && sudo systemctl restart isuxi.perl.service && sudo service nginx reload'
end

