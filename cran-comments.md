## Test environments
* ubuntu 14.04 (on Travis-CI), R 3.2.4
* win-builder (devel and release)
* local OS X install, R 3.2.4
* local ubuntu 14.04 , R 3.2.4
* local Windows 10, R 3.2.4

## R CMD check results
There were no ERRORS and one WARNING:

* 'qpdf' is needed for checks on size reduction of PDFs

## Downstream dependencies
I have also run R CMD check on downstream dependencies of junr 
(https://github.com/FvD/junr/blob/master/revdep/summary.md). 

But this is just for show, as there are no downstream dependencies yet.

