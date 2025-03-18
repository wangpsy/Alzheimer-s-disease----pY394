########
####
####
library(ggplot2)
library(Rmisc) 
library(corrplot)
library(ggcorrplot)
library(RColorBrewer)
library(grDevices)
#library(extrafont) # 导入外部字体
#library(extrafontdb) # 字体数据库
#library(Rttf2pt1)
#install.packages("ggcorr")
#library(ggcorr)
library(cowplot)
#setwd("/Users/xulian/Documents/workdir/project/shilab/plots/AD_phenotype")
setwd("/Users/xulian/Documents/workdir/project/shilab/plots/AD_phenotype/cor")
########
####
corCalPlot <- function(data,method="pearson",ti = "",order="AOE")
{
        env.cor <- round(cor(data,method = method),3)
        env.p <- round(cor_pmat(data,method=method),6)
        print(env.cor)
        print(env.p)
        file_out = paste0("./",ti,".plot.pdf")
        pdf(file =file_out,width = 5,height = 5 )
        corrplot(corr =env.cor,type = "upper",order = order,method="circle",diag = F,p.mat = env.p,col = rev(COL2('PuOr', 10)),tl.col = "black",addCoef.col = "white",title=ti,mar=c(0.2,2,0.2,0.2))
        dev.off()
        #ggsave(filename = file_out,p,width = 5,height = 5)
        #pdf(file = file_out)
        #print(p)
        #dev.off()
        
        
}
#dev.off()
################ test2
blots_data = read.table("blots_data.txt",sep="\t",header=T,check.names = F)
head(blots_data)
corCalPlot(blots_data,ti="blots_pear",order="original")
