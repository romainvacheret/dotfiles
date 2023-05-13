imap jk <Esc>
"
" nmap Gzz G
" vmap < <gv
" vmap > >gv

unmap <Space>

exmap splitv obcommand workspace:split-vertical
exmap splith obcommand workspace:split-horizontal
exmap tabclose obcommand workspace:close

exmap tabnext obcommand workspace:next-tab
exmap tabprev obcommand workspace:previous-tab

exmap forward obcommand app:go-forward
exmap back obcommand app:go-back

exmap followlink obcommand editor:follow-link

exmap focustop obcommand editor:focus-top
exmap focusbottom obcommand editor:focus-bottom
exmap focusleft obcommand editor:focus-left
exmap focusright obcommand editor:focus-right

map <Space>=v :splitv
map <Space>=h :splith
map <Space>=q :tabclose

map gt :tabnext
map gT :tabprev

map <C-i> :forward
map <C-o> :back

map gd :followlink

map <C-k> :focustop
map <C-j> :focusbottom
map <C-h> :focusleft
map <C-l> :focusright
