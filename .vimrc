set autoindent 	"자동 들여쓰기
set cindent  	"C언어 스타일의 들여쓰기
set smartindent "역시 자동들여쓰기
set nowrap  	"자동 줄바꿈 안함
set nowrapscan 	"찾기에서 파일의 맨 끝에 이르면 계속하여 찾지 않음
set ignorecase 	"찾기에서 대/소문자를 구별하지 않음
set nobackup 	"백업파일 만들지 않음
set number  	"행번호
set ruler  		"상태표시줄에 커서 위치를 보여줌
set tabstop=4 	"문서에 있는 '\t'문자를 몇 칸으로 보여줄지 결정
set shiftwidth=4	">> or << 키로 탭사이즈를 조절할때나 인텐트에서 자동 줄맞추기를 할때 사용
set softtabstop=4	"Tap 키를 눌렀을때 표시되는 간격 
"set expandtab "탭문자를 공백문자로 변환
set title  	"Title Bar에 현재 편집중이 파일 표시
set hlsearch 	"검색어 강조
set ignorecase 	"검색,편집,치환시 대소문자 구분하지 않음
set tags+=./tags "add current directory's generated tags file to available tags
set incsearch 	"do incremental searching
set laststatus=2	"to display edited filename

"from 성큰
set statusline=%h%F%m%r%=[%l:%c(%p%%)]
set mouse=a		"support mouse
set cursorline
set tagbsearch	"ctag binary search

syntax on  "자동 문법 강조
filetype plugin on  "파일 종류 자동 인식
filetype indent on

"클립보드 copy & paste
map <C-c> "+y
map <C-v> "+P

"cscope 설정
if filereadable("./cscope.out")
   cs add cscope.out
endif

"GUI 설정
if has("gui_running")
 "FONT 설정
 set guifont=DejaVu\ Sans\ Mono\ 10
 "배경테마 설정
 colorschem torte
 "시작시 크기 지정
 set lines=50
 set co=145
endif

"=============== key mapping =========="
map <F2> :BufExplorer<CR>
map <F3> v]}zf							"폴딩
map <F4> zo								"폴딩해제
map <F7> :SrcExplToggle<CR>
map <F8> :TlistToggle<CR>
map <F9> :NERDTreeToggle<CR>

map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D> 

"=============== man page 설정 ========"
func! Man()
	let sm = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>

"Plugin 설정
"=============== Project ==============="
let g:proj_flags = "mstcg" 
let g:proj_window_increment = 0

"========== Buffer Explorer ============"

"=============== source explorer =============="
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

"let g:SrcExpl_pluginList = [
"    \"__Tag_List__",
"    \"Source_Explorer",
" \]

"=============== taglist =============="
let Tlist_Use_Right_Window = 1   "분할 창을 오른쪽에 배치
let Tlist_Inc_Winwidth = 0     	 "콘솔창에서 vim 사용하기
let Tlist_Auto_Open = 0    	     "vi 실행시 TagList 자동실행
let Tlist_Exit_OnlyWindow = 1  	 "Close Vim if the taglist is the only window
let Tlist_File_Fold_Auto_Close = 1  "Close tag folds for inactive buffers
let Tlist_Sort_Type = "name"   	 "Sort method used for arranging the tabs

"=============== NERDTree =============="
let NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen = 1

"=============== gtags =============="
"fake cscope
set csprg=gtags-cscope
if filereadable("./GTAGS")
	cs add GTAGS
endif

nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
nmap <C-\><C-]> :GtagsCursor<CR>

