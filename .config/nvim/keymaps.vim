" Custom map
command Ss :split
command P set paste
command Np set nopaste
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
cnoremap rep %s/before/after/g
cnoremap jc! !javac
cnoremap ja! !java
nnoremap <C-O> :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
vnoremap v $h
inoremap <C-t> <Esc><Left>"zx"zpa
inoremap jj <ESC>
" move
nnoremap j gj
nnoremap k gk
" split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" tarm emacs
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" Custom Leader
let mapleader = ","
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>vs :vs<CR>
nnoremap <Leader>ss :split<CR>
nnoremap <Leader>h ^
nnoremap <Leader>l $
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

