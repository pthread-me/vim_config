syntax on

set termguicolors 

" my fav colour, from the .vim file that tracer gave me, remove " from line
" bellow to activate. ALSO dont have color and colorscheme set at the same time, comment one out
"color lilypink

"replace rosepine with rosepine_moon for a different look 
colorscheme rosepine

"setting the side bar to have numbers and the numbers to be relative (go figure)
set number relativenumber

"this is mainly to expilcitly specify the indentation used by cindent since it was doing 8 spaces so this fixes it
set tabstop=4 shiftwidth=4 softtabstop=4

set t_ut=""
set cindent autoindent 
set incsearch

set scrolloff=8
set colorcolumn=80
	

" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
"SI is insert mode, EI is normal mode (i think)
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"
