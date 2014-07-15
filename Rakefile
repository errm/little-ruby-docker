task :packaging_env do
 fail unless system "cd package && docker build -t errm/little-ruby-builder ."
end

task build_package: :packaging_env do
  fail unless system "docker run -v ${PWD}/package/bin:/home/openwrt/sdk/bin errm/little-ruby-builder"
end

task build_image: :build_package do
 fail unless system "docker build -t errm/little-ruby-docker ."
end

task push_image: :build_image do
 fail unless system "docker push errm/little-ruby-docker"
end

task default: :push_image
