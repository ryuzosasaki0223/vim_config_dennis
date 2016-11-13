" vim の独自拡張機能を使う(viとの互換性をとらない)
set nocompatible

" ファイルエンコードを指定する
set fileencodings=iso-2022-jp,sjis

" 自動認識させる改行コードを指定する
set fileformats=unix,dos

" バックアップをとる
" 逆は [ set nobackup ]
" set backup
set nobackup

" バックアップを作るディレクトリを指定する
" set backupdir=~/backup

" 検索履歴を50個残す
set history=50

" 検索時に大文字小文字を区別しない
set ignorecase

" 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase

" 検索語にマッチした単語をハイライトする
" 逆は [ set nohlsearch ]
set hlsearch

" インクリメンタルサーチを使う (
" 検索語を入れている途中から随時マッチする文字列の検索を開始)
" 逆は [ set noincsearch ]
set incsearch

" 行番号を表示する
" 逆は [ set nonumber ]
set number

" 括弧入力時に対応する括弧を強調する
set showmatch

" 構文ごとに色分け表示する
" 逆は [ syntax off ]
syntax on

" [ syntax on ] の場合のコメント文の色を変更する
highlight Comment ctermfg=LightCyan

" ウィンドウ幅で行を折り返す
" 逆は [ set nowrap ]
set wrap


"tabでspace2つぶん
set tabstop=2

"tab文字を半角スペースにする
set expandtab

set cursorline
set cursorcolumn

set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
       
if has('syntax')
   augroup ZenkakuSpace
     autocmd!
     autocmd ColorScheme       * call ZenkakuSpace()
     autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
   augroup END
   call ZenkakuSpace()
endif

"NeoBundleの設定
set nocompatible
filetype plugin indent off


if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
   call neobundle#begin(expand('~/.vim/bundle')) 
endif


NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tomasr/molokai'

call neobundle#end()
NeoBundleCheck

filetype plugin indent on

colorscheme molokai
