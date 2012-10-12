# rProv
An implementation of a provenance model for `R`. Package is currently in early development. 

There are two ways to obtain provenance information - dynamically and
staticly.  By dynamic, we mean at run-time when top-level commands are
issued. By static, we mean that we analyze an R script by parsing the
expressions and analyzing the sequence of potential/would-be commands.
The package CodeDepends helps with the latter. Facilities added to this package
aid with the dynamic approach using R's addTaskCallback() function.

Some of the task class material and related functions may migrate to the
CodeDepends package.

## Installation

```r
# install package devtools if you don't already have a copy
library(devtools)
install_github('CodeDepends', 'duncantl')
install_github('rProvenance', 'karthikram')
```

# Bugs and Issues
Please send any comments, suggestions for functionality to karthik.ram@gmail.com or if this is an issue on existing code, please file it [directly](https://github.com/karthikram/rProvenance/issues).