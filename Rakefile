task :packaging_env do
 sh "cd package && docker build -t errm/little-ruby-builder:2.1.2 ."
end

task build_package: :packaging_env do
  sh "docker run -v ${PWD}/package/bin:/home/openwrt/sdk/bin errm/little-ruby-builder:2.1.2"
end

task build_image: :build_package do
 sh "docker build -t errm/little-ruby-docker:2.1.2 ."
end

task flatten_image: :build_image do
  sh "docker run --name little-ruby errm/little-ruby-docker:2.1.2"
  sh "docker export little-ruby | docker import - errm/little-ruby-docker:2.1.2"
  sh "docker rm little-ruby"
end

task push_image: :flatten_image do
 sh "docker push errm/little-ruby-docker:2.1.2"
end


task default: :push_image
