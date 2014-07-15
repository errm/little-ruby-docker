FROM progrium/busybox

RUN opkg-install libpthread librt libdb47 libffi libgdbm libncurses libncursesw libopenssl libreadline zlib libyaml
ADD ./package/bin/x86_64/packages/ruby_1.9.3-p545-1_x86_64.ipk ruby_1.9.3-p545-1_x86_64.ipk
RUN opkg-cl install ./ruby_1.9.3-p545-1_x86_64.ipk && rm ./ruby_1.9.3-p545-1_x86_64.ipk
