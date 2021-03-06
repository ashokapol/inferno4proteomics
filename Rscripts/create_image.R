# Written by Ashoka D. Polpitiya
# for the Translational Genomics Research Institute (TGen, Phoenix, AZ)
# Copyright 2010, Translational Genomics Research Institute
# E-mail: ashoka@tgen.org
# Website: http://inferno4proteomics.googlecode.com
# -------------------------------------------------------------------------
#
# Licensed under the Apache License, Version 2.0; you may not use this file except
# in compliance with the License.  You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#
# -------------------------------------------------------------------------

rm(list=ls())
setwd("C:/Ashoka/SoftwareProjects/Inferno4Proteomics/Rscripts")

Rfiles <- dir(pattern="[R,r]$", recursive=TRUE)
idxgg <- x<-sapply(Rfiles, function(x) grepl("Plotting/gg",x))
idxstd <- x<-sapply(Rfiles, function(x) grepl("Plotting/std",x))
#Rfiles.stdplots <- Rfiles[idxstd]
#Rfiles.ggplots <- Rfiles[idxgg]
Rfiles <- Rfiles[!idxstd & !idxgg]
#browser()
for (i in 2:length(Rfiles))
  source(Rfiles[i], verbose=FALSE)
#browser()
rm("i","Rfiles")
save.image(file="C:/Ashoka/SoftwareProjects/Inferno4Proteomics/bin/Debug/Inferno.RData")

#-------------------------------------------------------------------
rm(list=ls())
setwd("C:/Ashoka/SoftwareProjects/Inferno4Proteomics/Rscripts/Plotting/std")

Rfiles <- dir(pattern="[R,r]$", recursive=TRUE)
for (i in 1:length(Rfiles))
  source(Rfiles[i], verbose=FALSE)

rm("i","Rfiles")
save.image(file="C:/Ashoka/SoftwareProjects/Inferno4Proteomics/bin/Debug/Inferno_stdplots.RData")

#-------------------------------------------------------------------
rm(list=ls())
setwd("C:/Ashoka/SoftwareProjects/Inferno4Proteomics/Rscripts/Plotting/gg")

Rfiles <- dir(pattern="[R,r]$", recursive=TRUE)
#browser()
for (i in 1:length(Rfiles))
  source(Rfiles[i], verbose=FALSE)

rm("i","Rfiles")
save.image(file="C:/Ashoka/SoftwareProjects/Inferno4Proteomics/bin/Debug/Inferno_ggplots.RData")

