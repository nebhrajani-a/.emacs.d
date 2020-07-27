;;
;; High Lighting for Verilog Mode
;;

(hilit-set-mode-patterns
 'verilog-mode
 '(;; comments
;   (("/\\* \\(FIXME\\|fixme\\)" "\\*/" urgent) ; this winds up being 2 overlays
;			   ("/\\*" "\\*/" comment))

   ("//.*$" nil comment)
   ("/\\*[\t\n]*.*\\*/" nil comment)
   ("\\<\\(if\\|else\\|while\\|for\\|repeat\\|always\\)\\>" nil keyword)

   ("\\(\\<fork\\>\\)\\|\\(\\<begin\\>\\)\\|\\(\\<if\\>\\)\\|\\(\\<else\\>\\)\\|\\(\\<task\\>\\)\\|\\(\\<function\\>\\)\\|\\(\\<initial\\>\\)\\|\\(\\<always\\>\\(\[ \t\]*\@\\)?\\)\\|\\(\\<while\\>\\)\\|\\(\\<for\\(ever\\)?\\>\\)\\|\\(\\<repeat\\>\\)\\|\\(\\<wait\\>\\)\\|\"\#\" " nil struct)

   ("begin[ \t]*:" nil keyword)

   ("\\<\\(begin\\|case\\|casex\\|casez\\|fork\\|table\\|specify\\)\\>" nil keyword)

   ("\\<\\(begin\\)\\|\\(case[xz]?\\)\\|\\(fork\\)\\|\\(table\\)\\|\\(specify\\)\\|\\(function\\)\\|\\(task\\)\\>" nil struct)

   ("\\<\\(end\\|join\\|endcase\\|endtable\\|endspecify\\)\\>" nil struct)

   ("\\(\\<end\\>\\)\\|\\(\\<endcase\\>\\)\\|\\(\\<join\\>\\)\\|\\(\\<endtable\\>\\)\\|\\(\\<endspecify\\>\\)\\|\\(\\<endfunction\\>\\)\\|\\(\\<endtask\\>\\)" nil struct)

    ("\\<\\(in\\(teger\\|put\\|out\\)\\|parameter\\|defparam\\|output\\|supply[01]?\\|event\\|tri\\(0\\|1\\|reg\\|and\\|or\\)?\\|w\\(ire\\|or\\|and\\)\\|time\\|re\\(al\\(time\\)?\\|g\\)\\)\\>" nil decl)  

   ("^[ \t\n]*module[ \t]" "[ \t]*;" glob-struct)

   ("\\(endmodule\\)" nil glob-struct)

   ("\\(\#.*\\|\`define\\)" nil c-preprocessor-exps)

   ("\"" ".*\"" string)
))

;(hilit-translate type        'CadetBlue
;		 actions     'Goldenrod
;		 decl        'SteelBlue
;		 struct      'green
;		 keyword     'SteelBlue
;		 glob-struct 'red)
 
