## Test environments
* ubuntu 14.04 (on Travis-CI), R 3.4.1
* win-builder (devel and release)
* local OS X install, R 3.4.1
* local Windows 10, R 3.4.1

## R CMD check results
There were no ERRORS and no WARNINGS

Changed tests at the request of Uwe Ligges to reduce test time on CRAN machines

FIXME: 
```
Found the following (possibly) invalid URLs:
  URL: http://cdcordoba.opendata.junar.com/home/?lang=en
    From: README.md
    Status: 403
    Message: Forbidden
```

I temporarily removed the link instead of fixing it.

FIXME:
```
Found the following \keyword or \concept entries
which likely give several index terms:
  File 'clean_currency.Rd':
    \keyword{Cleaning,}
    \keyword{Currency,}
```

Consider http://r-pkgs.had.co.nz/man.html (I used @family a lot and only @keywords internal):

> @keywords keyword1 keyword2 ... adds standardised keywords. Keywords are optional, but if present, must be taken from a predefined list found in file.path(R.home("doc"), "KEYWORDS").

> Generally, keywords are not that useful except for @keywords internal. Using the internal keyword removes the function from the package index and disables some of its automated tests. It’s common to use @keywords internal for functions that are of interest to other developers extending your package, but not most users.

## Downstream dependencies
I have run R CMD check on downstream dependencies of junr 
(https://github.com/FvD/junr/blob/master/revdep/summary.md). 

* No issues with downstream dependencies

FIXME: I failed to run revdepcheck
```
Error: Failed to install 'junr' from local:
  (converted from warning) installation of package ‘C:/Users/Mauro/AppData/Local/Temp/RtmpEjDFUY/file402865b72170/junr_0.2.0.9000.tar.gz’ had non-zero exit status
In addition: Warning message:
call dbDisconnect() when finished working with a connection 
```

