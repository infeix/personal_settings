if &compatible
  set nocompatible
endif

set runtimepath+=/home/jo/~/.nvim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/jo/~/.nvim/bundles')
  call dein#begin('/home/jo/~/.nvim/bundles')

  call dein#add('/home/jo/~/.nvim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  call dein#add('Shougo/dein.vim')
  call dein#add('ap/vim-buftabline')
  call dein#add('wellle/targets.vim')
  call dein#add('kana/vim-textobj-entire', {'on_map': {'xo' : ['ie', 'ae']}}) 
  call dein#add('SirVer/ultisnips' ,  {'on_map' : { 'i' : ['<TAB>'] }})
  call dein#add('tpope/vim-fugitive', { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ] })
  call dein#add('justinmk/vim-sneak', {'on_map' : ['<Plug>SneakLabel_s', '<Plug>SneakLabel_S']})
  call dein#add('tomtom/tcomment_vim', {'on_map': 'gc', 'on_cmd' : 'TComment'})
  call dein#add('kien/ctrlp.vim', { 'on_cmd' : 'CtrlPMRUFiles' })
  call dein#add('qpkorr/vim-renamer', { 'on_cmd': 'Renamer'})
  call dein#add('godlygeek/tabular', { 'on_cmd' : [ 'Tab', 'Tabularize' ] , 'augroup' : 'tabular' })
  call dein#add('tommcdo/vim-exchange', { 'on_map' : {'n' : 'cx', 'x' : 'X' } } ) 
  call dein#add('tpope/vim-repeat', {'on_map' : '.'}) 
  call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
  call dein#add('Raimondi/delimitMate', {'on_map' : { 'i' : ['(', '[', '{' ] }})
  call dein#add('terryma/vim-multiple-cursors', { 'on_map' : { 'n' : ['<C-n>', '<C-p>'], 'x' : '<C-n>'}}) 
  call dein#add('kana/vim-textobj-user')
  call dein#add('glts/vim-textobj-comment', {'on_map' :['<Plug>(textobj-comment-a)', '<Plug>(textobj-comment-i)', '<Plug>(textobj-comment-i)', '<Plug>(textobj-comment-big-a)']}) 
  call dein#add('coderifous/textobj-word-column.vim', {'on_map': {'xo' : ['ic', 'ac']}}) 
  call dein#add('kana/vim-textobj-indent', {'on_map': {'xo' : ['ii', 'ai']}}) 
  call dein#add('zirrostig/vim-schlepp', { 'on_map' :  ['<Plug>SchleppIndentDown', '<Plug>SchleppIndentUp', '<Plug>SchleppLeft', '<Plug>SchleppRight']}) 
  call dein#add('osyo-manga/vim-over', { 'on_cmd' : 'OverCommandLine' }) 
  call dein#add('bps/vim-textobj-python', { 'on_ft' : 'python' }) 
  call dein#add('tmhedberg/matchit', { 'on_ft' : 'html' }) 

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-d>'
:map <S-A-Up> <C-v>
:map <S-A-Down> <C-v>
