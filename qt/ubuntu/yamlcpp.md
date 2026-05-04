# yamlcpp

## 编译

1. 下载 https://github.com/jbeder/yaml-cpp
2. `mkdir build`
3. `cd build`
4. `cmake ..` (编译动态库版本 `cmake -DYAML_BUILD_SHARED_LIBS=ON`)
5. `make`
6. `sudo make install`
7. 需要yamlcpp.a有-fPIC，需要重新编译yamlcpp `cmake -DYAML_BUILD_SHARED_LIBS=OFF -DCMAKE_CXX_FLAGS="-fPIC" ..` 
