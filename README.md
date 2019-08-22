# lua4gba
lua4gba on Docker  

## Usage
    git clone https://github.com/gitcrtn/lua4gba.git
    cd lua4gba

    # build image
    docker build -t sample/lua4gba .

    # write some scripts
    cd $HOME/work
    mkdir -p filesystem/sprites
    touch filesystem/main.lua
    vi filesystem/main.lua

    # generate gba file from lua scripts
    docker run --rm -v $HOME/work:/pwd sample/lua4gba

## Requirements
Docker  

## License
[MIT](https://github.com/gitcrtn/lua4gba/blob/master/LICENSE)

## Author
[Carotene](https://github.com/gitcrtn)
