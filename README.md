Stan Examples
=============

This repository includes example code estimating commonly used models in Psychology and related fields using the [Stan] (http://mc-stan.org) and the R package [rstan] (http://code.google.com/p/stan/wiki/RStanGettingStarted). Where possible I have used data available from textbooks and online so that users can match up results with other software.


Structure
------------

Currently, each example has:

1. A `.stan` file that provides the Stan code for estimating the model.
2. A `.R` file that reads-in the data, processes the data, and calls Stan.

For the most part the `.R` files access the data directly because either (a) the file comes with R or (b) the file can be downloaded direclty from the web. In the future, I may include the data in text format.