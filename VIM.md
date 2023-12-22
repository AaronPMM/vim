
# VIM

# VIM or NVIM
---
Make sure use vim >= 8.2 or neovim >= 0.5.2

[nvim config](https://www.cnblogs.com/cniwoq/p/13272746.html "nvim config")

- 测试环境为ubuntu20.04, 推荐使用此版本.

```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt-get install -y neovim
neovim --version
```

```
sudo apt-get install git gcc g++ cmake pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev curl
```

- 对于 python2 还是推进安装，毕竟为了相应的兼容性。

## Install vim-plug

Vim
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
NeoVim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

example
```
call plug#begin()

" coc.nvim install
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

```

### 替换默认配置文件
#### Vim
- 将 `init.vim` 拷贝到当前用户根目录下，并重命名为 `~/.vimrc`
> - `cp init.vim ~/.vimrc`
- 将 `coc-settings.json` 拷贝到当前用户根目录下的 `~/.vim/`
> - `cp coc-settings.json ~/.vim/`

#### Neovim
- 将 `init.vim coc-settings.json` 这二个文件拷贝到当前用户的根目录下的 `~/.config/nvim/` 目录中.
> - `cp init.vim ~/.config/nvim/`
> - `cp coc-settings.json ~/.config/nvim/`

运行 vim or nvim 输入：`PlugInstall`就开始进行插件的安装，并将插件安装在 .vim/plugged


## coc.nvim 插件的安装
### 安装node, Install nodejs >= 14.14:

```
sudo apt install npm
if update to 9.1.2: npm install -g npm@9.1.2

sudo apt install node
or
curl -sL install-node.vercel.app/lts | sudo bash
or
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs

node --version
输出的版本号>=14.14
```
### 安装yarn

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install yarn

yarn --version
```

### pynvim

```
升级 pip3
sudo pip3 install --upgrade pip
安装 pynvim
sudo pip3 install pynvim
升级 pynvim
sudo pip3 install --upgrade pynvim

```

### install ruby

```
sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get purge ruby
sudo apt install ruby
```

### install tree-sitter

```
git clone https://github.com/tree-sitter/tree-sitter
cd tree-sitter
make
sudo make install
```

### install ctags clang

- if install vistar plugin, you need install ctags.

    ```sudo apt install ctags```

- if use c++/c language, you need install clang

    ```sudo apt install clang```

### npm 用于安装coc.nvim的相关插件的server
- [coc.nvim] Server languageserver.bash

    `npm i -g bash-language-server`
    
    如果出现错误
    
    ![image-20230423171709765](C:\Users\78157\AppData\Roaming\Typora\typora-user-images\image-20230423171709765.png)
    
    请执行
    
    ```
    npm cache clean --force
    ```
    
    
- 安装 pynvim

    `npm install -g neovim`

### coc plugin install
#### 现有的非 LSP 插件
- coc-emmet 提供 emmet 自动补全支持。
- coc-highlight 提供当前单词以及颜色高亮支持。
- coc-lists 提供常用列表支持。
- coc-pairs 提供自动配对支持。
- coc-snippets 提供代码块方案。
- coc-yank 提供 yank 高亮和历史列表。
- coc-git 提供 git chunks、状态、列表等支持。

```
let g:coc_global_extensions = [
 \    'coc-html', 
 \    'coc-java'
 \    'coc-css', 
 \    'coc-tsserver', 
 \    'coc-json', 
 \    'coc-snippets', 
 \    'coc-highlight', 
 \    'coc-pairs', 
 \    'coc-vetur', 
 \    'coc-prettier' ,
 \    'coc-sh',
 \    'coc-emmet',
 \    'coc-yank',
 \    'coc-clangd',
 \    'coc-pyright',
 \    'coc-markdownlink',
 \    'coc-cmake',
 \    'coc-git',
 \    'coc-yaml',
 \    'coc-syntax',
 \]
```

-  coc-json json语言的支持
- coc-clangd  C/Cpp 语言的支持
- coc-sh  bash 语言的支持
- coc-tsserver uses section tsserver, typescript and javascript
- coc-pyright  python3 语言的支持
- coc-prettier 格式美化

常用插件

```
coc-clangd
coc-cmake
coc-css
coc-diagnostic
coc-dictionary
coc-emoji
coc-flutter
coc-gitignore
coc-go
coc-highlight
coc-html
coc-java
coc-json
coc-julia
coc-markdownlint
coc-omni
coc-pyright
coc-r-lsp
coc-rome
coc-rust-analyzer
coc-sh
coc-snippets
coc-solargraph
coc-sourcekit
coc-syntax
coc-tabnine
coc-tag
coc-tsserver
coc-vetur
coc-vimlsp
coc-word
coc-yaml
coc-yank
```

## Install ccls or clangd
**于C++，coc.nvim支持clangd和ccls两种方案**, 推荐使用ccls方案。

### ccls

`sudo apt install ccls`

or

```
1. git clone --depth=1 --recursive https://github.com/MaskRay/ccls

2. cd ccls

3. # Download "Pre-Built Binaries" from https://releases.llvm.org/download.html and unpack to /path/to/clang+llvm

4. cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_PREFIX_PATH=/path/to/clang+llvm

5. sudo cmake --build Release --target install
```

- 安装好ccls之后，应该能在/usr/local/bin/目录下看到ccls这个文件
- 安装完成后，首先进入nvim中，然后输入:CocConfig(注意这是一个vim命令，不要忽略前面的冒号)，然后终端会出现一个新的页面，把下面的json文本粘贴进去(ctrl+shift+v)

```
{
     "ccls": {
            "command": "ccls",
            "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
            "rootPatterns": [
                ".ccls",
                ".ccls-root",
                "compile_commands.json",
                ".git/",
                ".hg/"
            ],
            "initializationOptions": {
                "cache": {
                    "directory": "/tmp/ccls"
                },
                "client": {
                    "snippetSupport": true
                },
                "highlight": {
                    "lsRanges": true
                }
            }
        }
}
```

### clangd
- 如果ccls和clangd都安装了， 则系统一般都会优先选择clangd，

    在打开vim后, 使用 clangd server 会在当前目录下面生成 **.clangd** 索引文件;
    在打开vim后，如果使用 ccls server 会在当前目录下面生成 **.cache** 索引文件;

`sudo apt-get install clangd`

> - `clangd version 10.0.0-4ubuntu1`

```
{
     "ccls": {
            "command": "clangd",
            "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
            "rootPatterns": [
                "compile_flag.txt",
                "compile_commands.json"
            ]
        }
}
```

## compile_commands.json

[**生成compile_commands.json**](https://github.com/MaskRay/ccls/wiki/Project-Setup "Project Setup")

### CMake

```
cmake -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
ln -s Debug/compile_commands.json .
```

### Make

```
bear -- make
```

or 

```
intercept-build make all # generates compile_commands.json from the `make all` ruleset
```

Ninja

```
# Format: ninja -t compdb rule_names... > compile_commands.json
ninja -C out/Release -t compdb cxx cc > compile_commands.json
```

GN

```
# Format: gn gen out/Release --export-compile-commands[=<target_name1,target_name2...>]
gn gen out/Release --export-compile-commands=cc
```

## clang-format

- 在所要设置的页面目录的根目录下面，放置附件中的 `.clang-format` 文件，coc-nvim 即可自动检测使用此文件中所设置的CPP格式来进行调整.

------------------------------------------------------------
Generated with [Mybase Desktop 8.2.11](http://www.wjjsoft.com/mybase.html?ref=markdown_export)
