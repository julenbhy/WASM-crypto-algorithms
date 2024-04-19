# WASM-crypto-algorithms

This repo takes the [crypto-algorithms](https://github.com/B-Con/crypto-algorithms) code collection and tweaks it for easy WebAssembly compilation using CMake.

# Setup:

wasi-sdk 21

    curl -sL https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-21/wasi-sdk-21.0-linux.tar.gz | sudo tar -xz -C /opt/



# Building:
    
1: If the required software is not installed where indicated above, modify the paths in ```compile.sh```.

2: Run ```compile.sh```



### Building with MUSL:
Since WASI is based on MUSL, it's appropriate to compare it with MUSL as well.

To compile with MUSL:

1: Install musl-cross:

    curl -sL https://musl.cc/x86_64-linux-musl-cross.tgz | sudo tar -xz -C /opt/

2: Uncomment the lines related to musl in ```compile.sh```.

3: : Run ```compile.sh```
