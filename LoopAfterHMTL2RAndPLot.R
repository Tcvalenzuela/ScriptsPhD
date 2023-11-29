####KValue Landscape for 15 turtles ####
library(ggplot2)
library(cowplot)
#Bengediv setwd ("~/myGoogleDrive/Phd/15Turtles/Figures/Landscapes/")
setwd ("Google Drive/Phd/15Turtles/Figures/Landscapes/")
customCols <- c("Unknown"="#999999",
"Other"="#4D4D4D",
"DNA/Academ"="#FF0000",
"DNA/CMC"="#FF200B",
"DNA/Crypton"="#FF3115",
"DNA/Ginger"="#FF3D1E",
"DNA/Harbinger"="#FF4825",
"DNA/hAT"="#FF512D",
"DNA/Kolobok"="#FF5A34",
"DNA/Maverick"="#FF623B",
"DNA"="#FF6A42",
"DNA/Merlin"="#FF7149",
"DNA/MULE"="#FF7850",
"DNA/P"="#FF7F57",
"DNA/PiggyBac"="#FF865E",
"DNA/Sola"="#FF8D65",
"DNA/TcMar"="#FF936C",
"DNA/Transib"="#FF9972",
"DNA/Zator"="#FF9F79",
"DNA/Dada"="#FFCFBC",
"DNA/Ginger-1"="#FFCFBC",
"DNA/Zisupton"="#FF8D65",
"RC/Helitron"="#FF00FF",
"LTR/DIRS"="#006400",
"LTR/Ngaro"="#197214",
"LTR/Pao"="#2A8024",
"LTR/Copia"="#3A8F33",
"LTR/Gypsy"="#489E42",
"LTR/ERVL"="#57AE51",
"LTR"="#65BD61",
"LTR/ERV1"="#73CD70",
"LTR/ERV"="#81DD80",
"LTR/ERVK"="#90ED90",
"LINE/L1"="#00008B",
"LINE"="#251792",
"LINE/RTE"="#38299A",
"LINE/CR1"="#483AA2",
"LINE/Rex-Babar"="#554BAA",
"LINE/L2"="#625CB1",
"LINE/Proto2"="#6E6DB9",
"LINE/LOA"="#797EC0",
"LINE/R1"="#848FC8",
"LINE/Jockey-I"="#8FA1CF",
"LINE/Dong-R4"="#99B3D7",
"LINE/R2"="#A3C5DE",
"LINE/Penelope"="#660066",
"LINE/CRE"="#C1D9FF",
"Retroposon/SVA"="#FF4D4D",
"SINE"="#9F1FF0",
"SINE/5S"="#A637F1",
"SINE/7SL"="#AD49F2",
"SINE/Alu"="#B358F3",
"SINE/tRNA"="#B966F4",
"SINE/tRNA-Alu"="#BF74F4",
"SINE/tRNA-RTE"="#C481F5",
"SINE/RTE"="#C98EF6",
"SINE/Deu"="#CE9BF7",
"SINE/tRNA-V"="#D3A7F7",
"SINE/MIR"="#D7B4F8",
"SINE/U"="#DFCDF9",
"SINE/tRNA-7SL"="#E2D9F9",
"SINE/tRNA-CR1"="#E5E5F9")
### Set directory ###
setwd ("/Volumes/Macintosh HD/Users/tomas/Google Drive/Phd/TE paper/Figures/Landscapes/")

#### Reading tables####
CarInsRAW<-read.table("CarIns.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE)
CheAbiRAW<-read.table("CheAbi.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
CheSerRAW<-read.table("CheSer.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
ChrPicRAW<-read.table("ChrPic.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
#MalTerRAW<-read.table("MalTer.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
PelSinRAW<-read.table("PelSin.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
EmySubRAW<-read.table("EmySub.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
CuoMccRAW<-read.table("CuoMcc.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
GopEvgRAW<-read.table("GopEvg.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
MauReeRAW<-read.table("MauRee.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
PlaMegRAW<-read.table("PlaMeg.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
PodExpRAW<-read.table("PodExp.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
TerCarRAW<-read.table("TerCar.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
TraScrRAW<-read.table("TraScr.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
DerCorRAW<-read.table("DerCor.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
CheMydRAW<-read.table("CheMyd.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
#DerMawRAW<-read.table("DerMaw.align.divsum.html_R.tsv", sep = "\t", header = T, check.names = FALSE )
###Empty tables ### 
CarIns_full <- data.frame(Kimura=character(),
                 Per=character(), 
                 Cat=character(), 
                 stringsAsFactors=FALSE) 
CheAbi_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
CheSer_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
ChrPic_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
PelSin_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
EmySub_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
CuoMcc_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
GopEvg_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
MauRee_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
PlaMeg_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
PodExp_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
TerCar_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
TraScr_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
DerCor_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 
CheMyd_full <- data.frame(Kimura=character(),
                    Per=character(), 
                    Cat=character(), 
                    stringsAsFactors=FALSE) 

### Transpose loop### 
for (i in seq(2, ncol(CarInsRAW), 1)) {
    df <- data.frame(CarInsRAW$Divergence, CarInsRAW[,i])
    df$Category <- colnames(CarInsRAW)[i]
    colnames(df) <- c("Kimura", "Per", "Cat")
    CarIns_full <- rbind(CarIns_full, df)
  }

for (i in seq(2, ncol(CheAbiRAW), 1)) {
  df <- data.frame(CheAbiRAW$Divergence, CheAbiRAW[,i])
  df$Category <- colnames(CheAbiRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  CheAbi_full <- rbind(CheAbi_full, df)
}
for (i in seq(2, ncol(CheSerRAW), 1)) {
  df <- data.frame(CheSerRAW$Divergence, CheSerRAW[,i])
  df$Category <- colnames(CheSerRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  CheSer_full <- rbind(CheSer_full, df)
}
for (i in seq(2, ncol(ChrPicRAW), 1)) {
  df <- data.frame(ChrPicRAW$Divergence, ChrPicRAW[,i])
  df$Category <- colnames(ChrPicRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  ChrPic_full <- rbind(ChrPic_full, df)
}
for (i in seq(2, ncol(PelSinRAW), 1)) {
  df <- data.frame(PelSinRAW$Divergence, PelSinRAW[,i])
  df$Category <- colnames(PelSinRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  PelSin_full <- rbind(PelSin_full, df)
}
for (i in seq(2, ncol(EmySubRAW), 1)) {
  df <- data.frame(EmySubRAW$Divergence, EmySubRAW[,i])
  df$Category <- colnames(EmySubRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  EmySub_full <- rbind(EmySub_full, df)
}
for (i in seq(2, ncol(CuoMccRAW), 1)) {
  df <- data.frame(CuoMccRAW$Divergence, CuoMccRAW[,i])
  df$Category <- colnames(CuoMccRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  CuoMcc_full <- rbind(CuoMcc_full, df)
}
for (i in seq(2, ncol(GopEvgRAW), 1)) {
  df <- data.frame(GopEvgRAW$Divergence, GopEvgRAW[,i])
  df$Category <- colnames(GopEvgRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  GopEvg_full <- rbind(GopEvg_full, df)
}
for (i in seq(2, ncol(MauReeRAW), 1)) {
  df <- data.frame(MauReeRAW$Divergence, MauReeRAW[,i])
  df$Category <- colnames(MauReeRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  MauRee_full <- rbind(MauRee_full, df)
}
for (i in seq(2, ncol(PlaMegRAW), 1)) {
  df <- data.frame(PlaMegRAW$Divergence, PlaMegRAW[,i])
  df$Category <- colnames(PlaMegRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  PlaMeg_full <- rbind(PlaMeg_full, df)
}
for (i in seq(2, ncol(PodExpRAW), 1)) {
  df <- data.frame(PodExpRAW$Divergence, PodExpRAW[,i])
  df$Category <- colnames(PodExpRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  PodExp_full <- rbind(PodExp_full, df)
}
for (i in seq(2, ncol(TerCarRAW), 1)) {
  df <- data.frame(TerCarRAW$Divergence, TerCarRAW[,i])
  df$Category <- colnames(TerCarRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  TerCar_full <- rbind(TerCar_full, df)
}
for (i in seq(2, ncol(TraScrRAW), 1)) {
  df <- data.frame(TraScrRAW$Divergence, TraScrRAW[,i])
  df$Category <- colnames(TraScrRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  TraScr_full <- rbind(TraScr_full, df)
}
for (i in seq(2, ncol(DerCorRAW), 1)) {
  df <- data.frame(DerCorRAW$Divergence, DerCorRAW[,i])
  df$Category <- colnames(DerCorRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  DerCor_full <- rbind(DerCor_full, df)
}
for (i in seq(2, ncol(CheMydRAW), 1)) {
  df <- data.frame(CheMydRAW$Divergence, CheMydRAW[,i])
  df$Category <- colnames(CheMydRAW)[i]
  colnames(df) <- c("Kimura", "Per", "Cat")
  CheMyd_full <- rbind(CheMyd_full, df)
}






CarIns<- ggplot(CarIns_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
CheAbi<- ggplot(CheAbi_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
CheSer<- ggplot(CheSer_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
ChrPic<- ggplot(ChrPic_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
PelSin<- ggplot(PelSin_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
EmySub<- ggplot(EmySub_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
CuoMcc<- ggplot(CuoMcc_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
GopEvg<- ggplot(GopEvg_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
MauRee<- ggplot(MauRee_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
PlaMeg<- ggplot(PlaMeg_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
PodExp<- ggplot(PodExp_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
TerCar<- ggplot(TerCar_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
TraScr<- ggplot(TraScr_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
DerCor<- ggplot(DerCor_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+ scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")
CheMyd<- ggplot(CheMyd_full, aes(fill=Cat, y=Per, x=Kimura, group=Cat)) + 
  geom_bar(position="stack", stat="identity") + ylab("Percentage of the genome")+
  scale_fill_manual(values = customCols)+ scale_y_continuous(limits = c(0,2.5)) +
  theme(legend.position="none")



pdf("~/Google Drive/Phd/TE paper/Figures/Landscapes/LandscapesGroupped.pdf", paper = "a4")
plot_grid(CarIns,CheAbi,CheMyd,
          CheSer,ChrPic,CuoMcc,
          DerCor,EmySub,GopEvg,
          MauRee,PelSin,PlaMeg,
          PodExp,TerCar,TraScr,
          labels ="AUTO", ncol = 3)
dev.off()


Mix<-plot_grid(CheMyd, DerCor,  labels = c('A', 'B'), label_size = 12)

plot_grid(CheMyd, DerCor, MauRee, CarIns,CheAbi,CheSer,ChrPic,CuoMcc,EmySub,GopEvg,PelSin,PlaMeg,PodExp,TerCar,TraScr,DerMaw, MalTer,NULL, 
          labels ="AUTO", ncol = 3)


pdf("~/myGoogleDrive/Phd/15Turtles/Figures/Landscapes/LandscapesGroupped.pdf",  width = 1500, height = 2000)
plot_grid(CheMyd, DerCor, MauRee, 
          CarIns,CheAbi,CheSer,
          ChrPic,CuoMcc,EmySub,
          GopEvg,PelSin, PlaMeg,
          PodExp,TerCar, TraScr,
          DerMaw, MalTer,NULL, 
          labels ="AUTO", ncol = 3)
dev.off()

