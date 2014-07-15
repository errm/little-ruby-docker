task :packaging_env do
  system "cd package && docker build -t errm/little-ruby-builder ."
end

task build_package: :packaging_env do
  system "docker run -v ${pwd}/package/target:/home/openwrt/sdk/target/linux/x86_64 errm/little-ruby-builder"
end
