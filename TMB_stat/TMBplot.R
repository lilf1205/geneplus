library(ggplot2)
library(GetoptLong)
size=10
color="grey"
GetoptLong(
	"infile=s","in put file",
	"color=s","bar color",
	"size=i",""

)
data<-read.table(infile,header=T)
pdf("TMB_barplot.pdf")
ggplot(data,aes(x=name,y=value))+geom_bar(stat="identity",fill=color)+
scale_y_continuous(expand = c(0,0),limits=c(0,max(data$value)*1.2))+theme_bw()+
theme(panel.background = element_blank(),panel.grid.major.x=element_blank(),
panel.grid.minor.x=element_blank(),panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank(),axis.text.x = element_text(colour="grey20",size=size,angle=60,hjust=1,vjust=1,face="plain"))+
labs(x="")
dev.off()
