#!/usr/local/bin/bash
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ [ Aesthir's Color Functions ] ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
Normal () { echo -ne "\[\e[m\]$*"; }                  ; Tblack () { echo -ne "\[\e[0;30m\]$*\[\e[m\]"; }
TNormal () { echo -ne "\[\e[m\]$*"; }                 ; Tred () { echo -ne "\[\e[0;31m\]$*\[\e[m\]"; }
Bold () { echo -ne "\[\e[1m\]$*\[\e[m\]"; }             ; Tgreen () { echo -ne "\[\e[0;32m\]$*\[\e[m\]"; }
TBold () { echo -ne "\[\e[1m\]$*\[\e[m\]"; }            ; Tbrown () { echo -ne "\[\e[0;33m\]$*\[\e[m\]"; }
Underline () { echo -ne "\[\e[4m\]$*\[\e[m\]"; }        ; Tyellow () { echo -ne "\[\e[0;33m\]$*\[\e[m\]"; }
TUnderline () { echo -ne "\[\e[4m\]$*\[\e[m\]"; }       ; Tblue () { echo -ne "\[\e[0;34m\]$*\[\e[m\]"; }
Flash () { echo -ne "\[\e[5m\]$*\[\e[m\]"; }            ; Tmagenta () { echo -ne "\[\e[0;35m\]$*\[\e[m\]"; }
TFlash () { echo -ne "\[\e[5m\]$*\[\e[m\]"; }           ; Tpurple () { echo -ne "\[\e[0;35m\]$*\[\e[m\]"; }
Invert () { echo -ne "\[\e[7m\]$*\[\e[m\]"; }           ; Taqua () { echo -ne "\[\e[0;36m\]$*\[\e[m\]"; }
TInvert () { echo -ne "\[\e[7m\]$*\[\e[m\]"; }          ; Tcyan () { echo -ne "\e[0;36m$*\e[m"; }
Invisible () { echo -ne "\[\e[8m\]$*\[\e[m\]"; }        ; Tgrey () { echo -ne "\[\e[0;37m\]$*\[\e[m\]"; }
TInvisible () { echo -ne "\[\e[8m\]$*\[\e[m\]"; }       ; Twhite () { echo -ne "\[\e[0;37m\]$*\[\e[m\]"; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Bold Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞ Underlined Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TblackB () { echo -ne "\[\e[1;30m\]$*\[\e[m\]"; }       ; TblackU () { echo -ne "\[\e[4;30m\]$*\[\e[m\]"; }
TgreyB () { echo -ne "\[\e[1;30m\]$*\[\e[m\]"; }        ; TredU () { echo -ne "\[\e[4;31m\]$*\[\e[m\]"; }
TredB () { echo -ne "\[\e[1;31m\]$*\[\e[m\]"; }         ; TgreenU () { echo -ne "\[\e[4;32m\]$*\[\e[m\]"; }
TgreenB () { echo -ne "\[\e[1;32m\]$*\[\e[m\]"; }       ; TbrownU () { echo -ne "\[\e[4;33m\]$*\[\e[m\]"; }
TbrownB () { echo -ne "\[\e[1;33m\]$*\[\e[m\]"; }       ; TyellowU () { echo -ne "\[\e[4;33m\]$*\[\e[m\]"; }
TyellowB () { echo -ne "\[\e[1;33m\]$*\[\e[m\]"; }      ; TblueU () { echo -ne "\[\e[4;34m\]$*\[\e[m\]"; }
TblueB () { echo -ne "\[\e[1;34m\]$*\[\e[m\]"; }        ; TmagentaU () { echo -ne "\[\e[4;35m\]$*\[\e[m\]"; }
TmagentaB () { echo -ne "\[\e[1;35m\]$*\[\e[m\]"; }     ; TpurpleU () { echo -ne "\[\e[4;35m\]$*\[\e[m\]"; }
TpurpleB () { echo -ne "\[\e[1;35m\]$*\[\e[m\]"; }      ; TaquaU () { echo -ne "\[\e[4;36m\]$*\[\e[m\]"; }
TaquaB () { echo -ne "\[\e[1;36m\]$*\[\e[m\]"; }        ; TcyanU () { echo -ne "\[\e[4;36m\]$*\[\e[m\]"; }
TcyanB () { echo -ne "\[\e[1;36m\]$*\[\e[m\]"; }        ; TgreyU () { echo -ne "\[\e[4;37m\]$*\[\e[m\]"; }
TwhiteB () { echo -ne "\[\e[1;37m\]$*\[\e[m\]"; }       ; TwhiteU () { echo -ne "\[\e[4;37m\]$*\[\e[m\]"; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Flashing Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Inverted Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TblackF () { echo -ne "\[\e[5;30m\]$*\[\e[m\]"; }       ; TblackI () { echo -ne "\[\e[7;40m\]$*\[\e[m\]"; }
TredF () { echo -ne "\[\e[5;31m\]$*\[\e[m\]"; }         ; TredI () { echo -ne "\[\e[7;41m\]$*\[\e[m\]"; }
TgreenF () { echo -ne "\[\e[5;32m\]$*\[\e[m\]"; }       ; TgreenI () { echo -ne "\[\e[7;42m\]$*\[\e[m\]"; }
TbrownF () { echo -ne "\[\e[5;33m\]$*\[\e[m\]"; }       ; TbrownI () { echo -ne "\[\e[7;43m\]$*\[\e[m\]"; }
TyellowF () { echo -ne "\[\e[5;33m\]$*\[\e[m\]"; }      ; TyellowI () { echo -ne "\[\e[7;43m\]$*\[\e[m\]"; }
TblueF () { echo -ne "\[\e[5;34m\]$*\[\e[m\]"; }        ; TblueI () { echo -ne "\[\e[7;44m\]$*\[\e[m\]"; }
TmagentaF () { echo -ne "\[\e[5;35m\]$*\[\e[m\]"; }     ; TmagentaI () { echo -ne "\[\e[7;45m\]$*\[\e[m\]"; }
TpurpleF () { echo -ne "\[\e[5;35m\]$*\[\e[m\]"; }      ; TpurpleI () { echo -ne "\[\e[7;45m\]$*\[\e[m\]"; }
TaquaF () { echo -ne "\[\e[5;36m\]$*\[\e[m\]"; }        ; TaquaI () { echo -ne "\[\e[7;46m\]$*\[\e[m\]"; }
TcyanF () { echo -ne "\[\e[5;36m\]$*\[\e[m\]"; }        ; TcyanI () { echo -ne "\[\e[7;46m\]$*\[\e[m\]"; }
TgreyF () { echo -ne "\[\e[5;37m\]$*\[\e[m\]"; }        ; TgreyI () { echo -ne "\[\e[7;47m\]$*\[\e[m\]"; }
TwhiteF () { echo -ne "\[\e[5;37m\]$*\[\e[m\]"; }       ; TwhiteI () { echo -ne "\[\e[7;47m\]$*\[\e[m\]"; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Invisible Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞ Plain Text on Color Background ∞∞∞∞∞∞∞∞ ##
TblackV () { echo -ne "\[\e[8;30m\]$*\[\e[m\]"; }       ; Bblack () { echo -ne "\[\e[m\]$*\[\e[m\]"; }
TredV () { echo -ne "\[\e[8;31m\]$*\[\e[m\]"; }         ; Bred () { echo -ne "\[\e[0;41m\]$*\[\e[m\]"; }
TgreenV () { echo -ne "\[\e[8;32m\]$*\[\e[m\]"; }       ; Bgreen () { echo -ne "\[\e[0;42m\]$*\[\e[m\]"; }
TbrownV () { echo -ne "\[\e[8;33m\]$*\[\e[m\]"; }       ; Bbrown () { echo -ne "\[\e[0;43m\]$*\[\e[m\]"; }
TyellowV () { echo -ne "\[\e[8;33m\]$*\[\e[m\]"; }      ; Byellow () { echo -ne "\[\e[0;43m\]$*\[\e[m\]"; }
TblueV () { echo -ne "\[\e[8;34m\]$*\[\e[m\]"; }        ; Bblue () { echo -ne "\[\e[0;44m\]$*\[\e[m\]"; }
TmagentaV () { echo -ne "\[\e[8;35m\]$*\[\e[m\]"; }     ; Bmagenta () { echo -ne "\[\e[0;45m\]$*\[\e[m\]"; }
TpurpleV () { echo -ne "\[\e[8;35m\]$*\[\e[m\]"; }      ; Bpurple () { echo -ne "\[\e[0;45m\]$*\[\e[m\]"; }
TaquaV () { echo -ne "\[\e[8;36m\]$*\[\e[m\]"; }        ; Baqua () { echo -ne "\[\e[0;46m\]$*\[\e[m\]"; }
TcyanV () { echo -ne "\[\e[8;36m\]$*\[\e[m\]"; }        ; Bcyan () { echo -ne "\[\e[0;46m\]$*\[\e[m\]"; }
TgreyV () { echo -ne "\[\e[8;37m\]$*\[\e[m\]"; }        ; Bgrey () { echo -ne "\[\e[0;47m\]$*\[\e[m\]"; }
TwhiteV () { echo -ne "\[\e[8;37m\]$*\[\e[m\]"; }       ; Bwhite () { echo -ne "\[\e[0;47m\]$*\[\e[m\]"; }
## ∞∞∞∞∞∞∞∞∞ Bold Text on Color Background ∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞ Underlined Text on Color Background ∞∞∞∞∞ ##
BblackB () { echo -ne "\[\e[1;40m\]$*\[\e[m\]"; }       ; BblackU () { echo -ne "\[\e[4;40m\]$*\[\e[m\]"; }
BredB () { echo -ne "\[\e[1;41m\]$*\[\e[m\]"; }         ; BredU () { echo -ne "\[\e[4;41m\]$*\[\e[m\]"; }
BgreenB () { echo -ne "\[\e[1;42m\]$*\[\e[m\]"; }       ; BgreenU () { echo -ne "\[\e[4;42m\]$*\[\e[m\]"; }
BbrownB () { echo -ne "\[\e[1;43m\]$*\[\e[m\]"; }       ; BbrownU () { echo -ne "\[\e[4;43m\]$*\[\e[m\]"; }
ByellowB () { echo -ne "\[\e[1;43m\]$*\[\e[m\]"; }      ; ByellowU () { echo -ne "\[\e[4;43m\]$*\[\e[m\]"; }
BblueB () { echo -ne "\[\e[1;44m\]$*\[\e[m\]"; }        ; BblueU () { echo -ne "\[\e[4;44m\]$*\[\e[m\]"; }
BmagentaB () { echo -ne "\[\e[1;45m\]$*\[\e[m\]"; }     ; BmagentaU () { echo -ne "\[\e[4;45m\]$*\[\e[m\]"; }
BpurpleB () { echo -ne "\[\e[1;45m\]$*\[\e[m\]"; }      ; BpurpleU () { echo -ne "\[\e[4;45m\]$*\[\e[m\]"; }
BaquaB () { echo -ne "\[\e[1;46m\]$*\[\e[m\]"; }        ; BaquaU () { echo -ne "\[\e[4;46m\]$*\[\e[m\]"; }
BcyanB () { echo -ne "\[\e[1;46m\]$*\[\e[m\]"; }        ; BcyanU () { echo -ne "\[\e[4;46m\]$*\[\e[m\]"; }
BgreyB () { echo -ne "\[\e[1;47m\]$*\[\e[m\]"; }        ; BgreyU () { echo -ne "\[\e[4;47m\]$*\[\e[m\]"; }
BwhiteB () { echo -ne "\[\e[1;47m\]$*\[\e[m\]"; }       ; BwhiteU () { echo -ne "\[\e[4;47m\]$*\[\e[m\]"; }
## ∞∞∞∞∞∞∞ Flashing Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞ Inverted Text on Color Background ∞∞∞∞∞∞ ##
BblackF () { echo -ne "\[\e[5;40m\]$*\[\e[m\]"; }       ; BblackI () { echo -ne "\[\e[7;30m\]$*\[\e[m\]"; }
BredF () { echo -ne "\[\e[5;41m\]$*\[\e[m\]"; }         ; BredI () { echo -ne "\[\e[7;31m\]$*\[\e[m\]"; }
BgreenF () { echo -ne "\[\e[5;42m\]$*\[\e[m\]"; }       ; BgreenI () { echo -ne "\[\e[7;32m\]$*\[\e[m\]"; }
BbrownF () { echo -ne "\[\e[5;43m\]$*\[\e[m\]"; }       ; BbrownI () { echo -ne "\[\e[7;33m\]$*\[\e[m\]"; }
ByellowF () { echo -ne "\[\e[5;43m\]$*\[\e[m\]"; }      ; ByellowI () { echo -ne "\[\e[7;33m\]$*\[\e[m\]"; }
BblueF () { echo -ne "\[\e[5;44m\]$*\[\e[m\]"; }        ; BblueI () { echo -ne "\[\e[7;34m\]$*\[\e[m\]"; }
BmagentaF () { echo -ne "\[\e[5;45m\]$*\[\e[m\]"; }     ; BmagentaI () { echo -ne "\[\e[7;35m\]$*\[\e[m\]"; }
BpurpleF () { echo -ne "\[\e[5;45m\]$*\[\e[m\]"; }      ; BpurpleI () { echo -ne "\[\e[7;35m\]$*\[\e[m\]"; }
BaquaF () { echo -ne "\[\e[5;46m\]$*\[\e[m\]"; }        ; BaquaI () { echo -ne "\[\e[7;36m\]$*\[\e[m\]"; }
BcyanF () { echo -ne "\[\e[5;46m\]$*\[\e[m\]"; }        ; BcyanI () { echo -ne "\[\e[7;36m\]$*\[\e[m\]"; }
BgreyF () { echo -ne "\[\e[5;47m\]$*\[\e[m\]"; }        ; BgreyI () { echo -ne "\[\e[7;37m\]$*\[\e[m\]"; }
BwhiteF () { echo -ne "\[\e[5;47m\]$*\[\e[m\]"; }       ; BwhiteI () { echo -ne "\[\e[7;37m\]$*\[\e[m\]"; }
## ∞∞∞∞∞∞ Invisible Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Color Code Notes ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
BblackV () { echo -ne "\[\e[8;40m\]$*\[\e[m\]"; }     ## Unless I missed something or made a mistake, I   ##
BredV () { echo -ne "\[\e[8;41m\]$*\[\e[m\]"; }       ## calculate a total of 7681 different color codes, ##
BgreenV () { echo -ne "\[\e[8;42m\]$*\[\e[m\]"; }     ## none of which produce a duplicate result.        ##
BbrownV () { echo -ne "\[\e[8;43m\]$*\[\e[m\]"; }     ##                      These will be fine for now. ##
ByellowV () { echo -ne "\[\e[8;43m\]$*\[\e[m\]"; }
BblueV () { echo -ne "\[\e[8;44m\]$*\[\e[m\]"; }
BmagentaV () { echo -ne "\[\e[8;45m\]$*\[\e[m\]"; }
BpurpleV () { echo -ne "\[\e[8;45m\]$*\[\e[m\]"; }
BaquaV () { echo -ne "\[\e[8;46m\]$*\[\e[m\]"; }
BcyanV () { echo -ne "\[\e[8;46m\]$*\[\e[m\]"; }
BgreyV () { echo -ne "\[\e[8;47m\]$*\[\e[m\]"; }
BwhiteV () { echo -ne "\[\e[8;47m\]$*\[\e[m\]"; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
``