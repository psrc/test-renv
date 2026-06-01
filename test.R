# https://www.youtube.com/watch?v=l01u7Ue9pIQ: Shannon Pileggis' posit talk about the downs and ups of renv, with short intro
# https://medium.com/@dineshkumarm740/making-r-projects-reproducible-a-friendly-guide-to-renv-for-data-scientists-bdfaecbd1ac7

# renv -  handles environments primarily at the package level

# renv gives you a separate library for each project. 
# This gives you the benefits of isolation: different projects can use different versions of packages, 
# and installing, updating, or removing packages in one project doesn’t affect any other project.

# it is a tool that can help make projects reproducible by helping with one part of the overall problem: R packages. 
# There are a number of other pieces that renv doesn’t currently provide much help with

library(renv)
library(tidyverse)
library(psrcplot)
library(ggiraph)

# init()
# renv::install("ggiraph@0.9.6")
# 
# # save library state to lockfile
# renv::snapshot()
# 
# # remove digest from library
# renv::remove("ggiraph")
# 
# renv::snapshot()

dataset <- mtcars
dataset$carname <- row.names(mtcars)

gg_point <- ggplot(
  data = dataset,
  mapping = aes(
    x = wt,
    y = qsec,
    color = disp,
    tooltip = carname,
    data_id = carname
  )
) +
  geom_point_interactive(hover_nearest = TRUE, size = 11 / .pt) +
  theme_minimal()

x <- girafe(
  ggobj = gg_point
)

x

# check library status
renv::status()
