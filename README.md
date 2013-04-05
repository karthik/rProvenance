# rProv
An implementation of a provenance model for `R`. Package is currently in early development. 

There are two ways to obtain provenance information - dynamically and
staticly.  By dynamic, we mean at run-time when top-level commands are
issued. By static, we mean that we analyze an R script by parsing the
expressions and analyzing the sequence of potential/would-be commands.
The package CodeDepends helps with the latter. Facilities added to this package
aid with the dynamic approach using R's addTaskCallback() function.
Dynamic capture of provenance information can be done deeper in the call stack
than just top-level commands.  We can rewrite functions so that they capture 
provenance information.

Some of the task class material and related functions may migrate to the
CodeDepends package.  

It is valuable to be able to include provenance for plots in the image
files.  For PNG, we can use a modified version of Simon Urbanek's png
package to read a PNG file, add metadata and then write it out. We can
also read the metadata via this package.  See
https://github.com/duncantl/png.git for a quick proof-of-concept.


## Installation

```r
# install package devtools if you don't already have a copy
library(devtools)
install_github('CodeDepends', 'duncantl')
install_github('rProvenance', 'karthikram')
```

# Bugs and Issues
Please send any comments, suggestions for functionality to karthik.ram@gmail.com or if this is an issue on existing code, please file it [directly](https://github.com/karthikram/rProvenance/issues).