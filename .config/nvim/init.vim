let s:base_dir = expand('~/.config/vim')

" reset augroup
augroup MyAutoCmd
autocmd!
augroup END

" runtimepathに追加
execute 'set runtimepath+=' . fnamemodify(s:base_dir, ':p')

runtime! basic.vim
runtime! keymaps.vim
runtime! dein.vim

