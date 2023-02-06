colorscheme solarized
syntax on
" set paste
set showmode
set showcmd
" 開啟行號顯示
set nu!
" 自動縮排
set autoindent
set cindent
" Tab鍵的寬度
set tabstop=4
" 統一縮排爲4
set softtabstop=4
set shiftwidth=4
"去掉錯誤音
set vb t_vb=
au GuiEnter * set t_vb=
" 選中狀態下 Ctrl+c 複製
vmap <C-c> y
" 對映全選+複製 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
"共用剪貼簿
set clipboard=unnamed
"解決插入模式下刪除失效問題
set backspace=2
autocmd vimEnter *.cpp map <F5> :w <CR> :!clear ; g++ --std=c++17 %  && echo Compiled successfully. && time ./a.out; <CR>

hi Normal ctermfg=252 ctermbg=none

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Powerline
set laststatus=2
set t_Co=256
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
