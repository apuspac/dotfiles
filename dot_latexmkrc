#!/usr/bin/env perl

use v5.10;
use experimental qw(smartmatch);

$do_cd = 1;

# lualatex
$lualatex     = 'lualatex -synctex=1 -file-line-error -interaction=nonstopmode';
$pdflualatex  = $lualatex;

# bib
$biber        = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex       = 'bibtex %O %B';

$makeindex    = 'mendex %O -o %D %S';
$out_dir = 'out';

$max_repeat   = 5;
$pdf_mode     = 4;


# preview
$pvc_view_file_via_temporary = 0;
given ($^O) {
    when (/MSWin32/) {
        $pdf_previewer = 'start %S';
    }
    when (/linux/) {
        $pdf_previewer = 'evince %S';
    }
    when (/darwin/) {
        $pdf_previewer = 'open %S';
    }
    default {
        $pdf_previewer = 'start %S';
    }
}

# local config
$local_latexmkrc_path = './.latexmkrc.local';
require $local_latexmkrc_path if -e $local_latexmkrc_path;

# 解説はCaffeLatte memoで
