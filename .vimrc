syntax on
color lilypink
"colorscheme peachpuff
set number relativenumber
set tabstop=4
set t_ut=

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
