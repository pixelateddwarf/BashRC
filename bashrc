##################################################################################
# .bashrc                                                                        #   
#                                                                                #
# Pixelated Dwarf                                                                # 
# Basic Bashrc file                                                              #  
#                                                                                #
# Date: Mar 5, 2021                                                              #
# Revision: 134                                                                  #
##################################################################################

# Source global definitions -- do this first because we overwrite some defaults
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

##################################################################################
#                                Aliases                                         #
##################################################################################

# Aliases I just can't live without
ulimit -c 10000000 2>/dev/null
alias ls='ls -lha --color=auto'
alias grep='grep --color=tty'
alias egrep='egrep --color=tty'
alias cd..='cd ..'
alias del='rm -i'
alias l.='ls -d .*'
alias v='vim -R -'
alias vi='vim'
alias psa='ps auxf'
alias psA='ps -Af'
alias du='du -h'
alias df='df -h'
alias l='\ls --color=auto'
alias ll.='l. -l'
alias ll='ls -l'
alias cd.='cd `pwd -LP`'
alias su-='su -'
alias xxargs="xargs -d '\n'"
alias ssh-nokey="ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null"
alias scp-nokey="scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null"

# Auto-sudo (if not root)
if [ $UID != 0 ] ; then
	alias yum='sudo yum'
	alias dnf='sudo dnf'
	alias chkconfig='sudo chkconfig'
	alias apt='sudo apt'
fi

export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T: '

##################################################################################
#                  Prompt Colors                                                 #
##################################################################################

   LGRAY="\\033[1;30m"
    LRED="\\033[1;31m"
  LGREEN="\\033[1;32m"
 LYELLOW="\\033[1;33m"
   LBLUE="\\033[1;34m"
 LPURPLE="\\033[1;35m"
   LCYAN="\\033[1;36m"
  LWHITE="\\033[1;37m"
   DGRAY="\\033[0;30m"
    DRED="\\033[0;31m"
  DGREEN="\\033[0;32m"
 DYELLOW="\\033[0;33m"
   DBLUE="\\033[0;34m"
 DPURPLE="\\033[0;35m"
   DCYAN="\\033[0;36m"
  DWHITE="\\033[0;37m"
 NOCOLOR="\\033[0m"

PS_LGRAY="\[${LGRAY}\]"
PS_LRED="\[${LRED}\]"
PS_LGREEN="\[${LGREEN}\]"
PS_LYELLOW="\[${LYELLOW}\]"
PS_LBLUE="\[${LBLUE}\]"
PS_LPURPLE="\[${LPURPLE}\]"
PS_LCYAN="\[${LCYAN}\]"
PS_LWHITE="\[${LWHITE}\]"
PS_DGRAY="\[${DGRAY}\]"
PS_DRED="\[${DRED}\]"
PS_DGREEN="\[${DGREEN}\]"
PS_DYELLOW="\[${DYELLOW}\]"
PS_DBLUE="\[${DBLUE}\]"
PS_DPURPLE="\[${DPURPLE}\]"
PS_DCYAN="\[${DCYAN}\]"
PS_DWHITE="\[${DWHITE}\]"
PS_NOCOLOR="\[${NOCOLOR}\]"

##################################################################################
#                    colors for root and reg users                               #
##################################################################################

if [ $UID == 0 ]; then
	export PS1="[${PS_DBLUE}\T ${PS_LRED}\u${PS_NOCOLOR}@${PS_LYELLOW}\H${PS_LBLUE} \W${PS_NOCOLOR}]\$ "
else
	export PS1="[${PS_DBLUE}\T ${PS_LGREEN}\u${PS_NOCOLOR}@${PS_LYELLOW}\H${PS_LBLUE} \W${PS_NOCOLOR}]\$ "
fi

# Add a little interactivity
__ps1_cmd_() {
	RET=$?
	if [ $UID == 0 ] ; then 
		USER_COLOR=$PS_LRED
	else 
		USER_COLOR=$PS_LGREEN
	fi
	
}
PROMPT_COMMAND=__ps1_cmd_


# do not overwrite files on > redirection
set -o noclobber
# update window size to fix wrapping
shopt -s checkwinsize

# Make sure the sbin paths are set as well, and add home's bin
PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin:$HOME/bin:$HOME/.home/bin:/.home/scripts"
export PATH

# lets hear it for vim!
export EDITOR="vim"
export VISUAL="vim"

#[ -z "$LANG" ] && export LANG="en_US.UTF8"

##################################################################################
#                          FILE COLORS                                           #
##################################################################################

##################################################################################
# Below are the color init strings for the basic file types. A color init        #
# string consists of one or more of the following numeric codes:                 #  
# Attribute codes:                                                               #     
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed                 #
# Text color codes:                                                              #
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white         #
# Background color codes:                                                        #
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white         #
##################################################################################


LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35\
:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31\
# executables (bright green)
:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32: *.bat=01;32\  
# Shell Scripts (yellow)
:*.sh=01;43: *.csh=01;43\
# archives or compressed (bright red)
:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31\
:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:\
# image formats
:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35\
:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35\
:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35\
:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35"

LS_COLORS="$LS_COLORS\
# text files: orange
# html htm doc txt css conf README
:*.html=00;33:*.htm=00;33:*.doc=00;33:*.txt=00;33:*.css=00;33\
:*.conf=00;33:*README=00;33\
# source files: yellow
# shtml java c cc cpp php pl h inc pm py
:*.shtml=01;33:*.java=01;33:*.c=01;33:*.cc=01;33:*.cpp=01;33:*.go=01;33\
:*.php=01;33:*.pl=01;33:*.h=01;33:*.inc=01;33:*.pm=01;33:*.py=01;33\
# files that don't belong: white on red
# core dead.letter
:*core=1;41:*dead.letter=01;41\
:*.class=00;32;32:*.o=00;32:*.so=00;32:*.exe=00;32\
# files to ignore (backups, etc): dark gray
# ,v (rcs version files), .bak, *~
:*,v=01;30:*.bak=01;30:*~=01;30"

export LS_COLORS

##################################################################################
#         COLORIZE MAN PAGES                                                     #
##################################################################################

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[45;93m' \
    LESS_TERMCAP_se=$'\e[0m' \

    command man "$@"
}

##################################################################################
#         LOCALIZE                                                               #
##################################################################################

#convert unix time to localtime
localtime() { perl -e "print scalar localtime $1"; echo ;}
#convert unix time to gmtime
gmtime() { perl -e "print scalar gmtime $1"; echo ;}

dt() { date +%Y%m%d_%H%M ; }
dts() { date +%Y%m%d_%H%M%S ; }


##################################################################################
#         BASHRC LOCAL                                                           #
##################################################################################

# Local overrides
if [ -f .bashrc_local ] ; then
	. ~/.bashrc_local
fi


