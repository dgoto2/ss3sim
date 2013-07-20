% ss3sim: An R package for generalized stock-assessment simulation with Stock Synthesis
% Sean C. Anderson^1*^ 
  Athol Whitten^2^
  Curry Cunningham^2^
  Felipe Hurtado Ferro^2^
  Kelli Johnson^2^
  Carey McGilliard^3^
  Cole Monnahan^2^
  Kotaro Ono^2^
  Juan Valero^2,4^
  Roberto Licandeo^5^
  Melissa Muradian^2^
  Cody Szuwalksi^2^
  Katyana Vertpre^6^
 (authorship and order to be discussed) 
%

^1^Department of Biological Sciences, Simon Fraser University, Burnaby BC, V5A 1S6,
Canada\
^2^School of Aquatic and Fishery Sciences, University of Washington, Box 355020, Seattle, WA 98195-5020, USA\
^3^NOAA\
^4^\
^5^UBC?\
^6^?

# Introduction #

Paragraph 1: What is stock assessment simulation? Why is it increasingly critical? 

- stock assessment simulation is...
- stock-assessment simulation is a critical component to evaluating stock assessment methods and understanding their strengths and weaknesses. ...
- important because it lets us test our assessments on known truths
- further, it lets us explore truths we are interested in and match (or mismatch) truths and assessments
- refs: @hilborn1992 among others; recent papers on stock-assessment simulation

2. Paragraph 2: What is SS3, why is it important, why simulate with it?

- Stock synthesis is a modelling framework... Integrated analysis --- models population dynamics using a wide range of data [@maunder2012]
- SS3 is the 3rd version of the software using this framework 
- SS software ref: @methot2012
- ADMB software ref: @fournier2012
- Importance of integrated analysis with SS as an example: @maunder2012
- most widely used now world wide (?) and especially on West Coast of United States
- facilitates rapid, reproducible analyses... focus on peer-review of the science not the modelling code
- allows a separation of research from stock assessment that informs management [@methot2012]
- been instrumental to investigating new stock assessment concepts: e.g. Piner et al. (2011), Methot and Taylor (2011)
- been  used in XX stock assessments world wide (~60 as of 2012 - ask Rick) and involved in many more currently
- @piner2011 example of stock-assessment simulation research with SS3
- @methot2011 example of stock-assessment research with SS

@methot2012:

> A comprehensive modeling framework such as SS enhances 
> communication, efficiency, and education in the fishery
> assessment community (Methot, 2009). Communication is 
> enhanced by creating a familiarity among users, reviewers, and
> clients regarding terminology and approach. Reviewers who are 
> already familiar with SS can quickly focus on key issues for 
> the assessment being reviewed, rather than spend time learning 
> the features of a novel assessment model.

Therefore two benefits to simulating with SS: (1) much of the model has already been built (research can then progress rapidly and with less chance of errors) and checked and (2) the results are directly applicable to the tools used by stock assessment scientists --- in fact, used by all Western US assessments.

Third paragraph: However, there are many complications to conducting large-scale, rapid, and reproducible simulations.

- complications range from data, file, and folder management
- avoiding coding errors
- repeatedly manipulating operating models and estimation models to ask specific questions
- porting models and questions across stocks and species
- reproducible, understandable, and documented
- barrier to research
- R [@r2013] is the standard, but existing solutions are GUI and therefore not as flexible, scriptable, and repeatable.

<!--Our goal is to provide a toolkit and general framework for fast, transparent, and reproducible stock assessment simulation.-->

In this paper we introduce ss3sim, a software package for the popular statistical programming language R that facilitates large-scale, rapid, and reproducible stock-assessment simulation with the widely-used SS framework. 
We begin by outlining the general philosophy of ss3sim, and describing its functions.
Then, to demonstrate how a researcher might conduct a stock-assessment simulation with ss3sim, we work through an example starting at a research question and ending with plots and interpretation of the output.
Our example includes considerations for setting up operating and estimation models, choosing a folder structure, model testing, and output manipulation and plotting. 
We conclude by discussing how ss3sim complements other stock assessment simulation software and outlining research questions our accessible and general SS simulation framework could address.

# The ss3sim framework #

## Terminology ##

- operating model
- estimation model
- scenario
- case
- iteration
- a simulation = all scenarios and iterations
- SS the framework vs. `SS3` the binary of version 3 of SS

## General philosophy ##

- Reproducible: documented in code or plain-text control files
- Flexible: specify your own OM and EM using all the possibilities of SS3
- Rapid: use SS3, which relies on ADMB; build on the existing SS and r4ss [@r4ss2013] framework
- Allow researchers to reuse control files as much as possible across scenarios to make the simulation easy to understand and less error prone
- Easy to deploy across multiple researchers, multiple computers, or multiple cores
- Leave a trace throughout of what has happened - log files etc.
- Make visualization easy so users are likely to use it to understand their models and detect errors quickly
- Minimize book keeping etc. so that researchers can concentrate on the science

## General structure ##

- start with an OM and EM
- Specify how you want to affect the truth and your assessment of the truth (possibly in a time varying manner)
- ss3sim carries that out in SS3 by manipulating and running the models in R
- SS is controlled by the user through a series of plain-text configuration files
- ss3sim works, in general, by converting simulation arguments (e.g. a given natural mortality trajectory) into manipulations of these configuration files at the appropriate stage in conjunction with running appropriate models

## Low-level generic ss3sim functions ##

See Table 1 for description of functions. See Figure 1 for the functions fit into the general structure. ss3sim functions are divided into three types of functions:

1. Functions that manipulate SS configuration files. These manipulations generate an underlying "truth" (operating models) and control our assessment of those models (estimation models).

2. Functions that conduct simulations. These functions generate a folder structure, call manipulation functions, run `SS3` as needed, and save the output.
`run_ss3sim`
`copy_models`
`run_ss3model`

3. Functions for analyzing and plotting simulation output.

## High-level tailored ss3sim functions ##

- an example framework
- because it relies on manipulation of these configuration files, it's important the config files match a specific format
- general framework, because you start with your own OM and EM, and a wide variety of questions are then available through manipulations of ..., ...

# An example simulation with ss3sim #

## Setting up the SS models ##

- the (simple) research question
- setting up the OM and EM SS models
- things to keep in mind
- running through SS to format as `.ss_new` files and renaming

## File and folder setup ##

- required files
- Why we chose a flat-file structure
- see vignette

## Translating research questions into configuration files ##

- E.g. time-varying M

## Deterministic model testing ##

- reduce recdevs, reduce sigma R, bias correction
- what to plot, what to look for, how good is OK?

## Output analysis and visualization ##

- examples using the included functions
- brief take home of what we'd conclude

# Discussion #

Other sections? how we validated it; benefit of using one well tested and well-understood model (but disadvantages too)
- benefit to playing with all the switches and understanding one framework (SS) well versus having many tools that we superficially understand

## How ss3sim complements other generic stock-assessment simulation software ##

- focus on "generic" software, e.g. not software the just works for salmon simulation

### r4ss ###

- @r4ss2013
- r4ss has functions to facilitate aspects of simulations, mostly focused on reading and plotting output for stock assessment
- ss3sim uses r4ss functions for some reading, writing, and bias adjustment

### flr ###

- @kell2007 for FLR and @hillary2009 for simulation in FLR
- statistical catch-at-age only?
- not integrated analysis, not SS
- but particularly relevant to Europe

### "Hooilator" ###

- http://fisherysimulation.codeplex.com, Windows only, GUI..., works on bootstrapped data only, therefore isn't as flexible as ss3sim. Used in:
    1. @lee2012
    2. @piner2011
    3. @lee2011

### Others? ###

## The need for balance between generalizing and tailoring in simulation software ##

- maybe?
- why we developed generic low-level functions and higher level functions
- but researchers are free to develop their own higher level functions
- because in an open-source MIT(?) licensed R package, users are free to modify functions as needed

## Maybe lessons learned? From Athol's work ##

- importance of version control
- benefits to developing analysis within an R package
- importance of model testing
- importance of rapid visualization of output, example `shiny` or `manipulator`

## Research opportunities with ss3sim ##

# Acknowledgements #

- funding: Fulbright Canada, NSERC, Simon Fraser University, ...
- discussions and advice: André Punt, Richard Methot, Ian Taylor, James Thorson, ...

# Figure captions #

Figure 1: Flow diagram of ss3sim

Figure 2: Panels with output from the example

# Tables #

Table 1: User-facing ss3sim functions and a description of their purpose.

----------------------------------------------------------------
Function name          Description
---------------------- -----------------------------------------
`change_f`             Changes the fishing mortality

`change_m`             Adds time-varying natural mortality 
                       features

`change_growth`        Adds time-varying growth features

`change_sel`           Adds time-varying selectivity

`change_e`             Controls what and how parameters are 
                       estimated

`change_lcomp`         Controls how length composition data are 
                       sampled

`change_agecomp`       Controls how age composition data are 
                       sampled

`change_index`         Controls how the fishery and survey
                       indices operate

`change_rec_devs`      Substitutes recruitment deviations

`change_retro`         Controls the number of years to discard 
                       for a retrospective analysis

`run_ss3sim`           Master function that runs an ss3sim 
                       simulation

`run_fish600`          Wrapper function that facilitates one 
                       particular simulation setup

`get_results_all`      Extract results from a series of 
                       scenarios

`get_results_scenario` Extract the results for a single scenario

`plotting functions!!` Plot the output...
---------------------- -----------------------------------------


Table X: Comparison with related software?
- maybe a table with the possible columns: software, reference, platform (e.g. R, GUI...), Short description/comparison, examples of papers using it

# References #