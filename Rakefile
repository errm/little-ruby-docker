task :packaging_env do
 fail unless system "cd package && docker build -t errm/little-ruby-builder ."
end

task build_package: :packaging_env do
  fail unless system "docker run -v ${PWD}/package/bin:/home/openwrt/sdk/bin errm/little-ruby-builder"
end
