#!/usr/local/bin/bash
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ [ Aesthir's Color Functions ] ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TReset () { printf '\e[0m'; }
Normal () { printf '\e[0m'"$*"; }                  ; Tblack () { printf '\e[0;30m'"$*"'\e[0m'; }
TNormal () { printf '\e[0m'"$*"; }                 ; Tred () { printf '\e[0;31m'"$*"'\e[0m'; }
Bold () { printf '\e[1m'"$*"'\e[0m'; }             ; Tgreen () { printf '\e[0;32m'"$*"'\e[0m'; }
TBold () { printf '\e[1m'"$*"'\e[0m'; }            ; Tbrown () { printf '\e[0;33m'"$*"'\e[0m'; }
Underline () { printf '\e[4m'"$*"'\e[0m'; }        ; Tyellow () { printf '\e[0;33m'"$*"'\e[0m'; }
TUnderline () { printf '\e[4m'"$*"'\e[0m'; }       ; Tblue () { printf '\e[0;34m'"$*"'\e[0m'; }
Flash () { printf '\e[5m'"$*"'\e[0m'; }            ; Tmagenta () { printf '\e[0;35m'"$*"'\e[0m'; }
TFlash () { printf '\e[5m'"$*"'\e[0m'; }           ; Tpurple () { printf '\e[0;35m'"$*"'\e[0m'; }
Invert () { printf '\e[7m'"$*"'\e[0m'; }           ; Taqua () { printf '\e[0;36m'"$*"'\e[0m'; }
TInvert () { printf '\e[7m'"$*"'\e[0m'; }          ; Tcyan () { printf '\e[0;36m'"$*"'\e[0m'; }
Invisible () { printf '\e[8m'"$*"'\e[0m'; }        ; Tgrey () { printf '\e[0;37m'"$*"'\e[0m'; }
TInvisible () { printf '\e[8m'"$*"'\e[0m'; }       ; Twhite () { printf '\e[0;37m'"$*"'\e[0m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Bold Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞ Underlined Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TblackB () { printf '\e[1;30m'"$*"'\e[0m'; }       ; TblackU () { printf '\e[4;30m'"$*"'\e[0m'; }
TgreyB () { printf '\e[1;30m'"$*"'\e[0m'; }        ; TredU () { printf '\e[4;31m'"$*"'\e[0m'; }
TredB () { printf '\e[1;31m'"$*"'\e[0m'; }         ; TgreenU () { printf '\e[4;32m'"$*"'\e[0m'; }
TgreenB () { printf '\e[1;32m'"$*"'\e[0m'; }       ; TbrownU () { printf '\e[4;33m'"$*"'\e[0m'; }
TbrownB () { printf '\e[1;33m'"$*"'\e[0m'; }       ; TyellowU () { printf '\e[4;33m'"$*"'\e[0m'; }
TyellowB () { printf '\e[1;33m'"$*"'\e[0m'; }      ; TblueU () { printf '\e[4;34m'"$*"'\e[0m'; }
TblueB () { printf '\e[1;34m'"$*"'\e[0m'; }        ; TmagentaU () { printf '\e[4;35m'"$*"'\e[0m'; }
TmagentaB () { printf '\e[1;35m'"$*"'\e[0m'; }     ; TpurpleU () { printf '\e[4;35m'"$*"'\e[0m'; }
TpurpleB () { printf '\e[1;35m'"$*"'\e[0m'; }      ; TaquaU () { printf '\e[4;36m'"$*"'\e[0m'; }
TaquaB () { printf '\e[1;36m'"$*"'\e[0m'; }        ; TcyanU () { printf '\e[4;36m'"$*"'\e[0m'; }
TcyanB () { printf '\e[1;36m'"$*"'\e[0m'; }        ; TgreyU () { printf '\e[4;37m'"$*"'\e[0m'; }
TwhiteB () { printf '\e[1;37m'"$*"'\e[0m'; }       ; TwhiteU () { printf '\e[4;37m'"$*"'\e[0m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Flashing Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Inverted Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
TblackF () { printf '\e[5;30m'"$*"'\e[0m'; }       ; TblackI () { printf '\e[7;40m'"$*"'\e[0m'; }
TredF () { printf '\e[5;31m'"$*"'\e[0m'; }         ; TredI () { printf '\e[7;41m'"$*"'\e[0m'; }
TgreenF () { printf '\e[5;32m'"$*"'\e[0m'; }       ; TgreenI () { printf '\e[7;42m'"$*"'\e[0m'; }
TbrownF () { printf '\e[5;33m'"$*"'\e[0m'; }       ; TbrownI () { printf '\e[7;43m'"$*"'\e[0m'; }
TyellowF () { printf '\e[5;33m'"$*"'\e[0m'; }      ; TyellowI () { printf '\e[7;43m'"$*"'\e[0m'; }
TblueF () { printf '\e[5;34m'"$*"'\e[0m'; }        ; TblueI () { printf '\e[7;44m'"$*"'\e[0m'; }
TmagentaF () { printf '\e[5;35m'"$*"'\e[0m'; }     ; TmagentaI () { printf '\e[7;45m'"$*"'\e[0m'; }
TpurpleF () { printf '\e[5;35m'"$*"'\e[0m'; }      ; TpurpleI () { printf '\e[7;45m'"$*"'\e[0m'; }
TaquaF () { printf '\e[5;36m'"$*"'\e[0m'; }        ; TaquaI () { printf '\e[7;46m'"$*"'\e[0m'; }
TcyanF () { printf '\e[5;36m'"$*"'\e[0m'; }        ; TcyanI () { printf '\e[7;46m'"$*"'\e[0m'; }
TgreyF () { printf '\e[5;37m'"$*"'\e[0m'; }        ; TgreyI () { printf '\e[7;47m'"$*"'\e[0m'; }
TwhiteF () { printf '\e[5;37m'"$*"'\e[0m'; }       ; TwhiteI () { printf '\e[7;47m'"$*"'\e[0m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞ Invisible Color Text ∞∞∞∞∞∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞ Plain Text on Color Background ∞∞∞∞∞∞∞∞ ##
TblackV () { printf '\e[8;30m'"$*"'\e[0m'; }       ; Bblack () { printf '\e[0m'"$*"'\e[0m'; }
TredV () { printf '\e[8;31m'"$*"'\e[0m'; }         ; Bred () { printf '\e[0;41m'"$*"'\e[0m'; }
TgreenV () { printf '\e[8;32m'"$*"'\e[0m'; }       ; Bgreen () { printf '\e[0;42m'"$*"'\e[0m'; }
TbrownV () { printf '\e[8;33m'"$*"'\e[0m'; }       ; Bbrown () { printf '\e[0;43m'"$*"'\e[0m'; }
TyellowV () { printf '\e[8;33m'"$*"'\e[0m'; }      ; Byellow () { printf '\e[0;43m'"$*"'\e[0m'; }
TblueV () { printf '\e[8;34m'"$*"'\e[0m'; }        ; Bblue () { printf '\e[0;44m'"$*"'\e[0m'; }
TmagentaV () { printf '\e[8;35m'"$*"'\e[0m'; }     ; Bmagenta () { printf '\e[0;45m'"$*"'\e[0m'; }
TpurpleV () { printf '\e[8;35m'"$*"'\e[0m'; }      ; Bpurple () { printf '\e[0;45m'"$*"'\e[0m'; }
TaquaV () { printf '\e[8;36m'"$*"'\e[0m'; }        ; Baqua () { printf '\e[0;46m'"$*"'\e[0m'; }
TcyanV () { printf '\e[8;36m'"$*"'\e[0m'; }        ; Bcyan () { printf '\e[0;46m'"$*"'\e[0m'; }
TgreyV () { printf '\e[8;37m'"$*"'\e[0m'; }        ; Bgrey () { printf '\e[0;47m'"$*"'\e[0m'; }
TwhiteV () { printf '\e[8;37m'"$*"'\e[0m'; }       ; Bwhite () { printf '\e[0;47m'"$*"'\e[0m'; }
## ∞∞∞∞∞∞∞∞∞ Bold Text on Color Background ∞∞∞∞∞∞∞∞ ## ∞∞∞∞∞∞ Underlined Text on Color Background ∞∞∞∞∞ ##
BblackB () { printf '\e[1;40m'"$*"'\e[0m'; }       ; BblackU () { printf '\e[4;40m'"$*"'\e[0m'; }
BredB () { printf '\e[1;41m'"$*"'\e[0m'; }         ; BredU () { printf '\e[4;41m'"$*"'\e[0m'; }
BgreenB () { printf '\e[1;42m'"$*"'\e[0m'; }       ; BgreenU () { printf '\e[4;42m'"$*"'\e[0m'; }
BbrownB () { printf '\e[1;43m'"$*"'\e[0m'; }       ; BbrownU () { printf '\e[4;43m'"$*"'\e[0m'; }
ByellowB () { printf '\e[1;43m'"$*"'\e[0m'; }      ; ByellowU () { printf '\e[4;43m'"$*"'\e[0m'; }
BblueB () { printf '\e[1;44m'"$*"'\e[0m'; }        ; BblueU () { printf '\e[4;44m'"$*"'\e[0m'; }
BmagentaB () { printf '\e[1;45m'"$*"'\e[0m'; }     ; BmagentaU () { printf '\e[4;45m'"$*"'\e[0m'; }
BpurpleB () { printf '\e[1;45m'"$*"'\e[0m'; }      ; BpurpleU () { printf '\e[4;45m'"$*"'\e[0m'; }
BaquaB () { printf '\e[1;46m'"$*"'\e[0m'; }        ; BaquaU () { printf '\e[4;46m'"$*"'\e[0m'; }
BcyanB () { printf '\e[1;46m'"$*"'\e[0m'; }        ; BcyanU () { printf '\e[4;46m'"$*"'\e[0m'; }
BgreyB () { printf '\e[1;47m'"$*"'\e[0m'; }        ; BgreyU () { printf '\e[4;47m'"$*"'\e[0m'; }
BwhiteB () { printf '\e[1;47m'"$*"'\e[0m'; }       ; BwhiteU () { printf '\e[4;47m'"$*"'\e[0m'; }
## ∞∞∞∞∞∞∞ Flashing Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞ Inverted Text on Color Background ∞∞∞∞∞∞ ##
BblackF () { printf '\e[5;40m'"$*"'\e[0m'; }       ; BblackI () { printf '\e[7;30m'"$*"'\e[0m'; }
BredF () { printf '\e[5;41m'"$*"'\e[0m'; }         ; BredI () { printf '\e[7;31m'"$*"'\e[0m'; }
BgreenF () { printf '\e[5;42m'"$*"'\e[0m'; }       ; BgreenI () { printf '\e[7;32m'"$*"'\e[0m'; }
BbrownF () { printf '\e[5;43m'"$*"'\e[0m'; }       ; BbrownI () { printf '\e[7;33m'"$*"'\e[0m'; }
ByellowF () { printf '\e[5;43m'"$*"'\e[0m'; }      ; ByellowI () { printf '\e[7;33m'"$*"'\e[0m'; }
BblueF () { printf '\e[5;44m'"$*"'\e[0m'; }        ; BblueI () { printf '\e[7;34m'"$*"'\e[0m'; }
BmagentaF () { printf '\e[5;45m'"$*"'\e[0m'; }     ; BmagentaI () { printf '\e[7;35m'"$*"'\e[0m'; }
BpurpleF () { printf '\e[5;45m'"$*"'\e[0m'; }      ; BpurpleI () { printf '\e[7;35m'"$*"'\e[0m'; }
BaquaF () { printf '\e[5;46m'"$*"'\e[0m'; }        ; BaquaI () { printf '\e[7;36m'"$*"'\e[0m'; }
BcyanF () { printf '\e[5;46m'"$*"'\e[0m'; }        ; BcyanI () { printf '\e[7;36m'"$*"'\e[0m'; }
BgreyF () { printf '\e[5;47m'"$*"'\e[0m'; }        ; BgreyI () { printf '\e[7;37m'"$*"'\e[0m'; }
BwhiteF () { printf '\e[5;47m'"$*"'\e[0m'; }       ; BwhiteI () { printf '\e[7;37m'"$*"'\e[0m'; }
## ∞∞∞∞∞∞ Invisible Text on Color Background ∞∞∞∞∞∞ ## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ Color Code Notes ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
BblackV () { printf '\e[8;40m'"$*"'\e[0m'; }     ## Unless I missed something or made a mistake, I   ##
BredV () { printf '\e[8;41m'"$*"'\e[0m'; }       ## calculate a total of 7681 different color codes, ##
BgreenV () { printf '\e[8;42m'"$*"'\e[0m'; }     ## none of which produce a duplicate result.        ##
BbrownV () { printf '\e[8;43m'"$*"'\e[0m'; }     ##                      These will be fine for now. ##
ByellowV () { printf '\e[8;43m'"$*"'\e[0m'; }
BblueV () { printf '\e[8;44m'"$*"'\e[0m'; }
BmagentaV () { printf '\e[8;45m'"$*"'\e[0m'; }
BpurpleV () { printf '\e[8;45m'"$*"'\e[0m'; }
BaquaV () { printf '\e[8;46m'"$*"'\e[0m'; }
BcyanV () { printf '\e[8;46m'"$*"'\e[0m'; }
BgreyV () { printf '\e[8;47m'"$*"'\e[0m'; }
BwhiteV () { printf '\e[8;47m'"$*"'\e[0m'; }
## ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞ ##
``