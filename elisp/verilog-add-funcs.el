(defun verilog-header ()
  "Insert a comment block containing the title, author, etc. in the format
   required by CDAC, Pune."
  (interactive)
  (insert "// ************************************************************************")
  (insert "\n//  Copyright (C) 1994 - Centre for Development of Advanced Computing")
  (insert "\n//  - H/W Development Group")
  (insert "\n// ************************************************************************")
  (insert "\n//\n//  Title:     ")
  (insert "\n//")
  (insert "\n//  Created:   " (current-time-string))
  (insert "\n//  Author:    " (user-full-name))
  (insert "\t<" (user-login-name) "@" (system-name) ">")
  (insert "\n//  Source File Name:   " (buffer-name))
  (insert "\n//")
  (insert "\n" (current-time-string))
  (beginning-of-line)
  (forward-char 20)
  (setq current-yr (current-word))
  (backward-char 12)
  (setq current-date (current-word))
  (forward-char 3)
  (setq current-hr (current-word))
  (forward-char 3)
  (setq current-min (current-word))
  (forward-char 3)
  (setq current-sec (current-word))
  (setq current-time (concat current-hr ":" current-min ":" current-sec))
  (backward-char 13)
  (cond ((equal (current-word) "Jan")
         (setq current-month "01"))
        ((equal (current-word) "Feb")
         (setq current-month "02"))
        ((equal (current-word) "Mar")
         (setq current-month "03"))
        ((equal (current-word) "Apr")
         (setq current-month "04"))
        ((equal (current-word) "May")
         (setq current-month "05"))
        ((equal (current-word) "Jun")
         (setq current-month "06"))
        ((equal (current-word) "Jul")
         (setq current-month "07"))
        ((equal (current-word) "Aug")
         (setq current-month "08"))
        ((equal (current-word) "Sep")
         (setq current-month "09"))
        ((equal (current-word) "Oct")
         (setq current-month "10"))
        ((equal (current-word) "Nov")
         (setq current-month "11"))
        ((equal (current-word) "Dec")
         (setq current-month "12")))

  (beginning-of-line)
  (kill-line 2)

  (insert "//  $Id: " (buffer-name) ",v 1.1 " current-yr "/" current-month "/" current-date " " current-time " " (user-login-name) " Exp $")
  (insert "\n//")
  (insert "\n//  Description:   ")
  (insert "\n//")
  (insert "\n//  Revision History:   ")
  (insert "\n//")
  (insert "\n//  $Log: " (buffer-name) ",v $")
  (insert "\n//")
  (insert "\n// ************************************************************************")
  (newline)
  (newline)
  (beginning-of-buffer)
  (search-forward "Title:")
  (end-of-line)
  (insert (read-string "Title for the design: "))
  (end-of-buffer))
