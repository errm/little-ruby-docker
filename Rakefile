task :packaging_env do
 fail unless system "cd package && docker build -t errm/little-ruby-builder ."
end

task build_package: :packaging_env do
  fail unless system "docker run -v ${PWD}/package/target:/home/openwrt/sdk/target/linux/x86_64 errm/little-ruby-builder"
end
