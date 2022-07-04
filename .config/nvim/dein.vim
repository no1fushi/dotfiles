let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_file = expand('~/.config/nvim/dein') . '/plugins.toml'
let s:toml_dir = expand('~/.config/nvim/dein/plugins')
if match( &runtimepath, '/dein.vim' ) == -1
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	call dein#load_toml( s:toml_dir . '/init_plugin.toml', {'lazy': 0} )
	call dein#load_toml( s:toml_dir . '/lazy_plugin.toml', {'lazy': 1} )
  call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif
