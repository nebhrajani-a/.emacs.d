       ;;
       ;; High Lighting for VHDL-Mode
       ;;

       (hilit-set-mode-patterns
	'vhdl-mode
	'(;; comments
	  ("--.*$" nil comment)
	  ;; main structure
	  ("^[ \t\n]*[Ee][Nn][Tt][Ii][Tt][Yy][ \t]" "[ \t][Ii][Ss]" glob-struct)
	  ("^[ \t\n]*[Aa][Rr][Cc][Hh][Ii][Tt][Ee][Cc][Tt][Uu][Rr][Ee][ \t]" "[ \t][Ii][Ss]" glob-struct)
	  ("^[ \t\n]*[Pp][Rr][Oo][Cc][Ee][Dd][Uu][Rr][Ee][ \t]" "\\([ \t][Ii][Ss]\\|)[ \t]*;\\)" defun)
	  ("^[ \t\n]*[Ff][Uu][Nn][Cc][Tt][Ii][Oo][Nn][ \t]" "[Rr][Ee][Tt][Uu][Rr][Nn][ \t]+[A-Za-z_0-9]+[ \t]*\\([Ii][Ss]\\|;\\)" defun)
	  ("^[ \t\n]*[Pp][Aa][Cc][Kk][Aa][Gg][Ee][ \t]" "[ \t][Ii][Ss]" glob-struct)
	  ("^[ \t\n]*[Cc][Oo][Nn][Ff][Ii][Gg][Uu][Rr][Aa][Tt][Ii][Oo][Nn][ \t]" "[ \t][Ii][Ss]" glob-struct)

	  ("^[ \t]*[A-Za-z_0-9]*[ \t]*:?[ \t]*[Pp][Rr][Oo][Cc][Ee][Ss][Ss]" "\n" defun)
	  ("^[ \t]*[A-Za-z_0-9]*[ \t]*:?[ \t]*[Bb][Ll][Oo][Cc][Kk]" "\n" defun)
	  ;; if there is no indentation before the "end", then it is most
	  ;; probably the end of the design unit
	  ("^[Ee][Nn][Dd]" ";" glob-struct)
	  ("^[ \t]*[Ee][Nn][Dd][ \t][Pp][Rr][Oo][Cc][Ee][Ss][Ss]" ";" defun)
	  ;; type declaration
	  ("^[ \t]*\\([Tt][Yy][Pp][Ee]\\|[Ss][Uu][Bb][Tt][Yy][Pp][Ee]\\)" ";" type)
	  ("^[ \t]+[Ii][Ss][ \t]+[Rr][Ee][Cc][Oo][Rr][Dd]" "[Ee][Nn][Dd][ \t]+[Rr][Ee][Cc][Oo][Rr][Dd];" type)
	  ;; VHDL-Objects 
	  ("^[ \t]*[Ss][Ii][Gg][Nn][Aa][Ll][ \t]" ";" decl)
	  ("^[ \t]*[Vv][Aa][Rr][Ii][Aa][Bb][Ll][Ee][ \t]" ";" decl)
	  ("^[ \t]*[Cc][Oo][Nn][Ss][Tt][Aa][Nn][Tt][ \t]" ";" decl)
	  ;; ALIAS
	  ("^[ \t]*[Aa][Ll][Ii][Aa][Ss][ \t]" ";" decl)
	  ;; ATTRIBUTES 
	  ("^[ \t]*[Aa][Tt][Tt][Rr][Ii][Bb][Uu][Tt][Ee][ \t]" ";" decl)
	  ;; Component Declaration
	  ;("^[ \t]*[Cc][Oo][Mm][Pp][Oo][Nn][Ee][Nn][Tt][ \t]" "\\([Pp][oO][rR][tT]\\|[Ii][Ss]\\)" decl)
	  ;("^[ \t]*[Ee][Nn][Dd][ \n\t]+[Cc][Oo][Mm][Pp][Oo][Nn][Ee][Nn][Tt]" ";" decl)
          ("^[ \t]*\\([Ee][Nn][Dd][ \t\n]+\\)*[Cc][Oo][Mm][Pp][Oo][Nn][Ee][Nn][Tt][^a-zA-Z0-9_].*"  nil decl) 
	  ;; program structure -- "null" omitted
	  ("\\([^a-zA-Z0-9_]\\|^\\)\\([Ii][Ff]\\|[Tt][Hh][Ee][Nn]\\|[Ee][Ll][Ss][Ee]\\|[Ee][Ll][Ss][Ii][Ff]\\|[Cc][Aa][Ss][Ee]\\|[Ww][Hh][Ee][Nn]\\|[Ll][Oo][Oo][Pp]\\|[Ss][Ee][Ll][Ee][Cc][Tt]\\|[Ff][Oo][Rr]\\|[Ww][Hh][Ii][Ll][Ee]\\|[Ee][Xx][Ii][Tt]\\|[Nn][Ee][Xx][Tt]\\|[Rr][Ee][Tt][Uu][Rr][Nn]\\|[Gg][Ee][Nn][Ee][Rr][Aa][Tt][Ee]\\)[^a-zA-Z0-9_]" nil struct)
	  ;; block structure
	  ("[ \n\t]\\([Bb][Ee][Gg][Ii][Nn]\\|[Ee][Nn][Dd]\\)[ \n\t;]" nil struct)
	  ;; other keywords
	  ("\\([^a-zA-Z0-9_]\\|^\\)\\([Aa][Ff][Tt][Ee][Rr]\\|[Aa][Ss][Ss][Ee][Rr][Tt]\\|[Ss][Ee][Vv][Ee][Rr][Ii][Tt][Yy]\\|[Rr][Ee][Pp][Oo][Rr][Tt]\\|[Aa][Cc][Cc][Ee][Ss][Ss]\\|[Bb][Uu][Ff][Ff][Ee][Rr]\\|\\[Rr][Ee][Gg][Ii][Ss][Tt][Ee][Rr]\\|[Bb][Uu][Ss]\\|[Dd][Ii][Ss][Cc][Oo][Nn][Nn][Ee][Cc][Tt]\\|[Gg][Uu][Aa][Rr][Dd][Ee][Dd]\\|[Ll][Aa][Bb][Ee][Ll]\\|[Ll][Ii][Nn][Kk][Aa][Gg][Ee]\\|[Nn][Ee][Ww]\\|[Nn][Uu][Ll][Ll]\\|[Oo][Pp][Ee][Nn]\\|[Oo][Tt][Hh][Ee][Rr][Ss]\\|[Rr][Aa][Nn][Gg][Ee]\\|[Rr][Ee][Cc][Oo][Rr][Dd]\\|[Tt][Rr][Aa][Nn][Ss][Pp][Oo][Rr][Tt]\\|[Ww][Aa][Ii][Tt]\\|[Tt][Oo]\\|[Do][Oo][Ww][Nn][Tt][Oo]\\|[Uu][Nn][Tt][Ii][Ll]\\|[Ii][Nn]\\|[Oo][Uu][Tt]\\|[Ii][Nn][Oo][Uu][Tt]\\|[Pp][Oo][Rr][Tt]\\|[Mm][Aa][Pp]\\)[^a-zA-Z0-9_]" nil keyword)

   ;; key words
   ("[^_]\\<\\(WHEN\\|when\\|BEGIN\\|begin\\|END\\|end\\|IF\\|if\\|ELSE\\|else\\|ELSIF\\|elsif\\|THEN\\|then\\|WAIT\\|wait\\|UNTIL\\|until\\|CASE\\|case\\|EXIT\\|exit\\|LOOP\\|loop\\|WHILE\\|while\\|FOR\\|for\\|to\\|TO\\|downto\\|DOWNTO\\|port map\\|PORT MAP\\|and\\|AND\\|or\\|OR\\|xor\\|XOR\\|not\\|NOT\\|nand\\|NAND\\)\\>[^_]" nil keyword)
   ;; vhdl lib key words
   ("[^_]\\<\\(DEBUG\\|debug\\|CheckSignal\\|checksignal\\|ASSERT\\|assert\\|REPORT\\|report\\|SEVERITY\\|severity\\|FREADLINE\\|freadline\\|FWRITELINE\\|fwriteline\\|PUTLINE\\|putline\\)\\>[^_]" 1 actions)
   ("[^_]\\<\\(FUNCTION\\|function\\|RETURN\\|return\\|SUBTYPE\\|subtype\\|PACKAGE\\|package\\|ARCHITECTURE\\|architecture\\|PORT\\|port\\|ALIAS\\|alias\\|CONSTANT\\|constant\\|SIGNAL\\|signal\\|VARIABLE\\|variable\\|TYPE\\|type\\|GENERIC\\|generic\\|USE\\|use\\|ENTITY\\|entity|\\PROCESS\\|process\\)\\>[^_]" nil keyword)


  ;; "library" and "use" are close to C cpp directives
   ("^[ \t]*\\([Uu][Ss][Ee]\\)" ";" include)
   ("^[ \t]*\\([Ll][Ii][Bb][Rr][Aa][Rr][Yy]\\)" ";" include)
   ;; nice for named parameters, but not so beautiful in case statements
   ("[A-Za-z_0-9.]+[ \t]*=>"   nil named-param)
   ;; string constants probably not everybody likes this one
   ("\"" ".*\"" string)))
       
       (hilit-translate type        'CadetBlue
			actions     'maroon
			decl        'SteelBlue
			struct      'RoyalBlue
			keyword     'SteelBlue
			glob-struct 'red)
 


(defun hilit-silent ()
  (interactive)
  (hilit-rehighlight-buffer t))