set autoindent
set noautowrite
set background=light
set backspace=2
set nobackup
set nocompatible
set comments=b:#,:%,fb:-,n:>,n:)
set noerrorbells
set esckeys
set noexpandtab
set formatoptions=cqrt
set helpheight=0
if version==58
	set helpfile=/usr/share/vim/vim58/doc/help.txt.gz
endif
set hidden
set highlight=8r,db,es,hs,mb,Mr,nb,rs,sr,tb,vr,ws
set nohlsearch
set noicon
set noignorecase
set noinsertmode
set iskeyword=@,48-57,_,192-255,-,/,:,.,@-@
set joinspaces
set laststatus=2
"set lazyredraw
"set list
"set listchars=tab:¨·,trail:·
set magic
set modeline
set modelines=1
set nonumber
set path=.,,~/,$VIM/syntax/,/usr/share/vim/vim63/syntax,~/work/layouts
set pastetoggle=<f11>
set report=0
set ruler
set shell=/usr/bin/zsh
set shiftwidth=2
set shortmess=at
set showcmd
set showmatch
set showmode
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar
set nostartofline
set splitbelow
set statusline=[%n]\ %F\ %(\ %M%R%H)%)\=<%l\,%c%V>=\ %P
set tabstop=2
if &term=="xterm"
	set t_Co=8
	set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
	set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
endif
" set notextmode
set textwidth=0
set title
if has("title")
	set titlestring=Vim\ :\ %f%m%r
endif
set nottyfast
set nottybuiltin
set ttyscroll=0
set undolevels=100
set viminfo=%,'50,\"100,:100,n~/.viminfo
set visualbell
set t_vb=
set whichwrap=<,>,h,l,[,]
set wildchar=<TAB>
set wrapmargin=1
set nowritebackup
" abbreviations -----------------------------
iab Yalpha abcdefghijklmnopqrstuvwxyz
iab YALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ
iab Ydigit 1234567890
iab Yruler 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
iab  Yell  [...]
vmap ,ell c[...]<ESC>
iab shoudl    should
iab teh       the
iab tuot tout
iab tuos tous
iab dse des
iab lse les
iab snot sont
" abbreviation for emails and news ---------
cab HEMAIL ^\(From\\|Cc\\|To\\|Date\\|Subject\\|Message-ID\\|Message-Id\\|X-\)
cab HNEWS  ^\(From\\|Cc\\|To\\|Date\\|Subject\\|Message-ID\\|X-\\|Newsgroups\)
" abbreviations - General Editing - Inserting Dates and Times
iab Ydate <C-R>=strftime("%y/%m/%d")<CR>
iab Ytime <C-R>=strftime("%H:%M")<CR>
iab YDT   <C-R>=strftime("%d %m %y %T")<CR>
iab YDATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab YTH   <C-R>=strftime("%d/%m/%Y:%H:%M ¤ moz ¤ ")<CR>

" MAPpings ----------------------------------
	map <F10> Bi<a href=<ESC>Ea></a><ESC>hhhi
  map #tw :set textwidth=<C-R>=col(".")<C-M>
  map K <NUL>
  map <C-Z> :shell
  noremap <C-^> <C-^>`"
  noremap gf gf`"
  noremap <C-G> 2<C-G>
" VIM - Editing and updating the vimrc:
  let vimrc='~/.vimrc'
  nn  ,u :source <C-R>=vimrc<CR><CR>
  nn  ,v :edit   <C-R>=vimrc<CR><CR>
" General Editing
 imap <C-e> <ESC>$a
 imap <C-a> <ESC>^i
 imap <Esc>[3~ <C-H>
 imap        <C-H>
 cmap        <C-H>
 cmap ;rcm %s/<C-M>//g
  nmap ,Sws :%s/ /_/g<C-M>
  vmap ,Sws :%s/ /_/g<C-M>
  nmap ,Stws :%s/  *$/_/g<C-M>
  vmap ,Stws :%s/  *$/_/g<C-M>
" Inserting Dates and Times / Updating Date+Time Stamps
  map ,L  1G/Last update:\s*/e+1<CR>CYDATE<ESC>
  map ,,L 1G/Last change:\s*/e+1<CR>CYDATE<ESC>
" General Editing - link to program "screen"
  map   ,Et :e /tmp/screen-exchange
" Email/News - Editing replies/followups
  map ,cel :%s/^\s\+$//
  map ,del :g/^\s\+$/d
  nmap ,cqel :%s/^[>]\+$//
  vmap ,cqel  :s/^[><C-I> ]\+$//
" Editing of email replies and Usenet followups - using autocommands
  autocmd!
  au! BufNewFile mutt* let @"="X-Editor: Vim-".version." http://www.vim.org\n"|exe 'norm 1G}""P'
  au BufNewFile,BufRead .letter,mutt*,nn.*,snd.* set tw=70
   map ,dp vip:s/^> //<CR>
  vmap ,dp    :s/^> //<CR>
   map ,qp   vip:s/^/> /<CR>
  vmap ,qp    :s/^/> /<CR>
  nmap  ##   vip:s/^/#<space>/<CR>
  vmap  ##      :s/^/#<space>/<CR>
  vmap ,kpq :s/^> *[a-zA-Z]*>/> >/<C-M>
  vmap ,fq :s/^> \([-":}\|][ <C-I>]\)/> > /
  nmap ,we vip:v/HEMAIL/d
  vmap ,we    :v/HEMAIL/d
  nmap ,wp vip:v/HNEWS/d
  vmap ,wp    :v/HNEWS/d

  cnoremap <C-A>      <Home>
  cnoremap <C-E>      <End>


syntax on

