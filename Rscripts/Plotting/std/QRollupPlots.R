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

# Plot QRollup data
plotScaleData.QRup <- function(pdata,
                               Data=Eset,
                               file="deleteme.png",
                               bkground="white",
                               IPI="IPI:IPI00009793.1",
                               datalabels=TRUE)
# pdata : output from protein rollup (scale.proteins)
{
    #png(filename=file,width=1152,height=864,pointsize=12,bg=bkground,
    #        res=600)
    require(Cairo)
    CairoPNG(filename=file,width=IMGwidth,height=IMGheight,pointsize=FNTsize,bg=bkground,res=Res)

    #Data <- Eset
    tryCatch(
    {
        if (datalabels)
          xlabels <- colnames(Data)
        else
          xlabels <- 1:dim(Data)[2]
        protIPI <- ProtInfo[,2]
        MassTags <- ProtInfo[,1]
        #Prots <- pdata[,-c(1,2)]
        pidx <- which(protIPI==IPI)
        data_idx <- is.element(row.names(Data),MassTags[pidx])
        currProtData <- Data[data_idx,]

        Pdata <- pdata[rownames(pdata)==IPI,]
        Score <- format(Pdata[2], digits=4)
        Pdata <- Pdata[-c(1,2)]
        
        par(mfrow=c(2,1))
        if (length(pidx) == 1)
        {
            plot(currProtData,type="o",pch=19,main=IPI,ylab="Raw Data",
                col="blue", xaxt="n")
            axis(1,at=1:length(xlabels),labels=xlabels, las = 2)
            grid()
        }
        else
        {
            mainT <- paste(IPI, "(QPRo=", Score, ")", sep=" ")
            matplot(t(currProtData),type="o",main=mainT,ylab="Raw Data",
                xlab="", xaxt="n")
            axis(1,at=1:length(xlabels),labels=xlabels, las = 2)
            lines(Pdata,type="l",lwd=2)
            grid()
            mtext(paste(dim(currProtData)[1],"Peptides",sep=" "), 3)
        }
    },
    interrupt = function(ex)
    {
      cat("An interrupt was detected.\n");
      print(ex);
    },
    error = function(ex)
    {
      plot(c(1,1),type="n",axes=F,xlab="",ylab="")
      text(1.5,1,paste("Error:", ex),cex=2)
      cat("An error was detected.\n");
      print(ex);
    },
    finally =
    {
      cat("Releasing tempfile...");
      dev.off()
      cat("done\n");
    }) # tryCatch()
}
