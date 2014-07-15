FROM progrium/busybox

RUN opkg-install libpthread librt libdb47 libffi libgdbm libncurses libncursesw libopenssl libreadline zlib libyaml
ADD ./package/bin/x86_64/packages/ruby_2.0.0-p481-1_x86_64.ipk ruby_2.0.0-p481-1_x86_64.ipk
RUN opkg-cl install ./ruby_2.0.0-p481-1_x86_64.ipk && rm ./ruby_2.0.0-p481-1_x86_64.ipk
