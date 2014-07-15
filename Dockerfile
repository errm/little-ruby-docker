FROM progrium/busybox

ADD ./package/bin/x86_64/packages/ruby_1.9.3-p545-1_x86_64.ipk ruby_1.9.3-p545-1_x86_64.ipk
RUN opkg-install ./ruby_1.9.3-p545-1_x86_64.ipk && rm ./ruby_1.9.3-p545-1_x86_64.ipk
