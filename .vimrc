syntax on

" my fav colour, from the .vim file that tracer gave me
"color lilypink 
set termguicolors 
colorscheme rosepine "(dont currently have this but im putting it here to remember to get it someday)

"setting the side bar to have numbers and the numbers to be relative (go figure)
set number relativenumber

"this is mainly to expilcitly specify the indentation used by cindent since it was doing 8 spaces so this fixes it
set tabstop=4 shiftwidth=4

set t_ut=""
set cindent autoindent 
set incsearch

	
" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).

"SI is insert mode, not sure what EI is tbh
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"
