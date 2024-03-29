#!/usr/local/bin/bash
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ [ ORIGINAL Aesthir's Color Functions ] ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TReset () { printf '\e[0m'; }
Normal () { printf '\e[m'"$*"; }                  ; Tblack () { printf '\e[0;30m'"$*"'\e[m'; }
TNormal () { printf '\e[m'"$*"; }                 ; Tred () { printf '\e[0;31m'"$*"'\e[m'; }
Bold () { printf '\e[1m'"$*"'\e[m'; }             ; Tgreen () { printf '\e[0;32m'"$*"'\e[m'; }
TBold () { printf '\e[1m'"$*"'\e[m'; }            ; Tbrown () { printf '\e[0;33m'"$*"'\e[m'; }
Underline () { printf '\e[4m'"$*"'\e[m'; }        ; Tyellow () { printf '\e[0;33m'"$*"'\e[m'; }
TUnderline () { printf '\e[4m'"$*"'\e[m'; }       ; Tblue () { printf '\e[0;34m'"$*"'\e[m'; }
Flash () { printf '\e[5m'"$*"'\e[m'; }            ; Tmagenta () { printf '\e[0;35m'"$*"'\e[m'; }
TFlash () { printf '\e[5m'"$*"'\e[m'; }           ; Tpurple () { printf '\e[0;35m'"$*"'\e[m'; }
Invert () { printf '\e[7m'"$*"'\e[m'; }           ; Taqua () { printf '\e[0;36m'"$*"'\e[m'; }
TInvert () { printf '\e[7m'"$*"'\e[m'; }          ; Tcyan () { printf '\e[0;36m'"$*"'\e[m'; }
Invisible () { printf '\e[8m'"$*"'\e[m'; }        ; Tgrey () { printf '\e[0;37m'"$*"'\e[m'; }
TInvisible () { printf '\e[8m'"$*"'\e[m'; }       ; Twhite () { printf '\e[0;37m'"$*"'\e[m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Bold Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞ Underlined Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TblackB () { printf '\e[1;30m'"$*"'\e[m'; }       ; TblackU () { printf '\e[4;30m'"$*"'\e[m'; }
TgreyB () { printf '\e[1;30m'"$*"'\e[m'; }        ; TredU () { printf '\e[4;31m'"$*"'\e[m'; }
TredB () { printf '\e[1;31m'"$*"'\e[m'; }         ; TgreenU () { printf '\e[4;32m'"$*"'\e[m'; }
TgreenB () { printf '\e[1;32m'"$*"'\e[m'; }       ; TbrownU () { printf '\e[4;33m'"$*"'\e[m'; }
TbrownB () { printf '\e[1;33m'"$*"'\e[m'; }       ; TyellowU () { printf '\e[4;33m'"$*"'\e[m'; }
TyellowB () { printf '\e[1;33m'"$*"'\e[m'; }      ; TblueU () { printf '\e[4;34m'"$*"'\e[m'; }
TblueB () { printf '\e[1;34m'"$*"'\e[m'; }        ; TmagentaU () { printf '\e[4;35m'"$*"'\e[m'; }
TmagentaB () { printf '\e[1;35m'"$*"'\e[m'; }     ; TpurpleU () { printf '\e[4;35m'"$*"'\e[m'; }
TpurpleB () { printf '\e[1;35m'"$*"'\e[m'; }      ; TaquaU () { printf '\e[4;36m'"$*"'\e[m'; }
TaquaB () { printf '\e[1;36m'"$*"'\e[m'; }        ; TcyanU () { printf '\e[4;36m'"$*"'\e[m'; }
TcyanB () { printf '\e[1;36m'"$*"'\e[m'; }        ; TgreyU () { printf '\e[4;37m'"$*"'\e[m'; }
TwhiteB () { printf '\e[1;37m'"$*"'\e[m'; }       ; TwhiteU () { printf '\e[4;37m'"$*"'\e[m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Flashing Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Inverted Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TblackF () { printf '\e[5;30m'"$*"'\e[m'; }       ; TblackI () { printf '\e[7;40m'"$*"'\e[m'; }
TredF () { printf '\e[5;31m'"$*"'\e[m'; }         ; TredI () { printf '\e[7;41m'"$*"'\e[m'; }
TgreenF () { printf '\e[5;32m'"$*"'\e[m'; }       ; TgreenI () { printf '\e[7;42m'"$*"'\e[m'; }
TbrownF () { printf '\e[5;33m'"$*"'\e[m'; }       ; TbrownI () { printf '\e[7;43m'"$*"'\e[m'; }
TyellowF () { printf '\e[5;33m'"$*"'\e[m'; }      ; TyellowI () { printf '\e[7;43m'"$*"'\e[m'; }
TblueF () { printf '\e[5;34m'"$*"'\e[m'; }        ; TblueI () { printf '\e[7;44m'"$*"'\e[m'; }
TmagentaF () { printf '\e[5;35m'"$*"'\e[m'; }     ; TmagentaI () { printf '\e[7;45m'"$*"'\e[m'; }
TpurpleF () { printf '\e[5;35m'"$*"'\e[m'; }      ; TpurpleI () { printf '\e[7;45m'"$*"'\e[m'; }
TaquaF () { printf '\e[5;36m'"$*"'\e[m'; }        ; TaquaI () { printf '\e[7;46m'"$*"'\e[m'; }
TcyanF () { printf '\e[5;36m'"$*"'\e[m'; }        ; TcyanI () { printf '\e[7;46m'"$*"'\e[m'; }
TgreyF () { printf '\e[5;37m'"$*"'\e[m'; }        ; TgreyI () { printf '\e[7;47m'"$*"'\e[m'; }
TwhiteF () { printf '\e[5;37m'"$*"'\e[m'; }       ; TwhiteI () { printf '\e[7;47m'"$*"'\e[m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Invisible Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞ Plain Text on Color Background ∞∞∞∞∞∞∞∞ ##
TblackV () { printf '\e[8;30m'"$*"'\e[m'; }       ; Bblack () { printf '\e[m'"$*"'\e[m'; }
TredV () { printf '\e[8;31m'"$*"'\e[m'; }         ; Bred () { printf '\e[0;41m'"$*"'\e[m'; }
TgreenV () { printf '\e[8;32m'"$*"'\e[m'; }       ; Bgreen () { printf '\e[0;42m'"$*"'\e[m'; }
TbrownV () { printf '\e[8;33m'"$*"'\e[m'; }       ; Bbrown () { printf '\e[0;43m'"$*"'\e[m'; }
TyellowV () { printf '\e[8;33m'"$*"'\e[m'; }      ; Byellow () { printf '\e[0;43m'"$*"'\e[m'; }
TblueV () { printf '\e[8;34m'"$*"'\e[m'; }        ; Bblue () { printf '\e[0;44m'"$*"'\e[m'; }
TmagentaV () { printf '\e[8;35m'"$*"'\e[m'; }     ; Bmagenta () { printf '\e[0;45m'"$*"'\e[m'; }
TpurpleV () { printf '\e[8;35m'"$*"'\e[m'; }      ; Bpurple () { printf '\e[0;45m'"$*"'\e[m'; }
TaquaV () { printf '\e[8;36m'"$*"'\e[m'; }        ; Baqua () { printf '\e[0;46m'"$*"'\e[m'; }
TcyanV () { printf '\e[8;36m'"$*"'\e[m'; }        ; Bcyan () { printf '\e[0;46m'"$*"'\e[m'; }
TgreyV () { printf '\e[8;37m'"$*"'\e[m'; }        ; Bgrey () { printf '\e[0;47m'"$*"'\e[m'; }
TwhiteV () { printf '\e[8;37m'"$*"'\e[m'; }       ; Bwhite () { printf '\e[0;47m'"$*"'\e[m'; }
## ∞∞∞∞∞∞∞∞∞ Bold Text on Color Background ∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞ Underlined Text on Color Background ∞∞∞∞∞ ##
BblackB () { printf '\e[1;40m'"$*"'\e[m'; }       ; BblackU () { printf '\e[4;40m'"$*"'\e[m'; }
BredB () { printf '\e[1;41m'"$*"'\e[m'; }         ; BredU () { printf '\e[4;41m'"$*"'\e[m'; }
BgreenB () { printf '\e[1;42m'"$*"'\e[m'; }       ; BgreenU () { printf '\e[4;42m'"$*"'\e[m'; }
BbrownB () { printf '\e[1;43m'"$*"'\e[m'; }       ; BbrownU () { printf '\e[4;43m'"$*"'\e[m'; }
ByellowB () { printf '\e[1;43m'"$*"'\e[m'; }      ; ByellowU () { printf '\e[4;43m'"$*"'\e[m'; }
BblueB () { printf '\e[1;44m'"$*"'\e[m'; }        ; BblueU () { printf '\e[4;44m'"$*"'\e[m'; }
BmagentaB () { printf '\e[1;45m'"$*"'\e[m'; }     ; BmagentaU () { printf '\e[4;45m'"$*"'\e[m'; }
BpurpleB () { printf '\e[1;45m'"$*"'\e[m'; }      ; BpurpleU () { printf '\e[4;45m'"$*"'\e[m'; }
BaquaB () { printf '\e[1;46m'"$*"'\e[m'; }        ; BaquaU () { printf '\e[4;46m'"$*"'\e[m'; }
BcyanB () { printf '\e[1;46m'"$*"'\e[m'; }        ; BcyanU () { printf '\e[4;46m'"$*"'\e[m'; }
BgreyB () { printf '\e[1;47m'"$*"'\e[m'; }        ; BgreyU () { printf '\e[4;47m'"$*"'\e[m'; }
BwhiteB () { printf '\e[1;47m'"$*"'\e[m'; }       ; BwhiteU () { printf '\e[4;47m'"$*"'\e[m'; }
## ∞∞∞∞∞∞∞ Flashing Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞ Inverted Text on Color Background ∞∞∞∞∞∞ ##
BblackF () { printf '\e[5;40m'"$*"'\e[m'; }       ; BblackI () { printf '\e[7;30m'"$*"'\e[m'; }
BredF () { printf '\e[5;41m'"$*"'\e[m'; }         ; BredI () { printf '\e[7;31m'"$*"'\e[m'; }
BgreenF () { printf '\e[5;42m'"$*"'\e[m'; }       ; BgreenI () { printf '\e[7;32m'"$*"'\e[m'; }
BbrownF () { printf '\e[5;43m'"$*"'\e[m'; }       ; BbrownI () { printf '\e[7;33m'"$*"'\e[m'; }
ByellowF () { printf '\e[5;43m'"$*"'\e[m'; }      ; ByellowI () { printf '\e[7;33m'"$*"'\e[m'; }
BblueF () { printf '\e[5;44m'"$*"'\e[m'; }        ; BblueI () { printf '\e[7;34m'"$*"'\e[m'; }
BmagentaF () { printf '\e[5;45m'"$*"'\e[m'; }     ; BmagentaI () { printf '\e[7;35m'"$*"'\e[m'; }
BpurpleF () { printf '\e[5;45m'"$*"'\e[m'; }      ; BpurpleI () { printf '\e[7;35m'"$*"'\e[m'; }
BaquaF () { printf '\e[5;46m'"$*"'\e[m'; }        ; BaquaI () { printf '\e[7;36m'"$*"'\e[m'; }
BcyanF () { printf '\e[5;46m'"$*"'\e[m'; }        ; BcyanI () { printf '\e[7;36m'"$*"'\e[m'; }
BgreyF () { printf '\e[5;47m'"$*"'\e[m'; }        ; BgreyI () { printf '\e[7;37m'"$*"'\e[m'; }
BwhiteF () { printf '\e[5;47m'"$*"'\e[m'; }       ; BwhiteI () { printf '\e[7;37m'"$*"'\e[m'; }
## ∞∞∞∞∞∞ Invisible Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Color Code Notes ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
BblackV () { printf '\e[8;40m'"$*"'\e[m'; }     ## Unless I missed something or made a mistake, I   ##
BredV () { printf '\e[8;41m'"$*"'\e[m'; }       ## calculate a total of 7681 different color codes, ##
BgreenV () { printf '\e[8;42m'"$*"'\e[m'; }     ## none of which produce a duplicate result.        ##
BbrownV () { printf '\e[8;43m'"$*"'\e[m'; }     ##                      These will be fine for now. ##
ByellowV () { printf '\e[8;43m'"$*"'\e[m'; }
BblueV () { printf '\e[8;44m'"$*"'\e[m'; }
BmagentaV () { printf '\e[8;45m'"$*"'\e[m'; }
BpurpleV () { printf '\e[8;45m'"$*"'\e[m'; }
BaquaV () { printf '\e[8;46m'"$*"'\e[m'; }
BcyanV () { printf '\e[8;46m'"$*"'\e[m'; }
BgreyV () { printf '\e[8;47m'"$*"'\e[m'; }
BwhiteV () { printf '\e[8;47m'"$*"'\e[m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
``