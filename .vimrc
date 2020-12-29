" Pluggins:
" - nerdtree = file tree
" - ctrlp.vim = search a file name
" - ack.vim = find across files
" - vim-prettier = format files
" - vim-jsx-pretty = format jsx files
" - ale = lint
" - gruvbox = retro color scheme

" vim 8 pluggins (.vim/pack/plugins/start)
packloadall

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Set ctrlp vim plugin, for searching files
set runtimepath^=~/.vim/pack/vendor/start/ctrlp.vim

" pathogen is a plugin manager for vim. 
" PS vim 8 has this natively. But still, a third party solution is more portable.
call pathogen#infect()

" (disabled)
" filetype plugin indent on

" Key binding for NERDTree
map <C-b> :NERDTreeToggle<CR>

" Indent settings (disabled)
" set autoindent
" set cindent
" inoremap { {<CR>}<up><end><CR>
" imap <C-Return> <CR><CR><C-o>k<Tab>

" FORMATTERS
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#tab_width = 2
let g:prettier#config#require_pragma = 'false'
let g:prettier#config#single_quote= 'true'
let g:prettier#config#print_width= '100'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" let g:vim_jsx_pretty_colorful_config = 1 " default 0
" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_config_files = ['.prettierrc.json']
" when running at every change you may want to disable quickfix
" let g:prettier#config#config_precedence = 'file-override'
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync

" Extra config
set scrolloff=5 " show lines above and below cursor (when possible)
set lazyredraw " skip redrawing screen in some case

" Set color scheme
set background=dark

autocmd vimenter * ++nested colorscheme gruvbox

" Needed for autocomplete
set encoding=utf-8

" Fix issue with tmux overriding the colors of vim
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" https://github.com/ctrlpvim/ctrlp.vim customization 
" Exclude .gitignore from ctrlp results
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" This displays all the results, not a trimmed shorter version
let g:ctrlp_max_files=0

