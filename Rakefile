task :packaging_env do
 fail unless system "cd package && docker build -t errm/little-ruby-builder:2.1.2 ."
end

task build_package: :packaging_env do
  fail unless system "docker run -v ${PWD}/package/bin:/home/openwrt/sdk/bin errm/little-ruby-builder:2.1.2"
end

task build_image: :build_package do
 fail unless system "docker build -t errm/little-ruby-docker:2.1.2 ."
end

task flatten_image: :build_image do
  fail unless system "docker run --name little-ruby errm/little-ruby-docker:2.1.2"
  fail unless system "docker export little-ruby | docker import - errm/little-ruby-docker:2.1.2"
end

task push_image: :flatten_image do
 fail unless system "docker push errm/little-ruby-docker:2.1.2"
end


task default: :push_image
