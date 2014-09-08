library(reshape2)
library(ggplot2)

#pdf("plots.pdf")
png("img/plot-%d.png", width=1000, height=500)

daten=read.table(file = 'data.txt', header = TRUE, sep = "|", strip.white = TRUE)

# tagessummen zusammenfassen
ausgaben=tapply(X=daten$Betrag.in.., INDEX = list(daten$Datum, daten$Bezahler.in), FUN=sum)

# liste erzeugen
ausgabenReshape=melt(ausgaben, colnames(ausgaben))
colnames(ausgabenReshape) = c('Datum', 'Name', 'Ausgaben')

## Barplot Ausgaben
###################

ggplot(ausgabenReshape, aes(x=factor(Datum),y=Ausgaben, fill=Name)) +
    geom_bar(stat="identity", position=position_dodge()) +
    xlab("Datum") + ylab("Ausgaben in €") +
    ggtitle("Verteilung Tages-Ausgaben")

## kummulierte Ausgaben
#######################
ausgabenReshape[is.na(ausgabenReshape)]=0
proTag = aggregate(Ausgaben ~ Datum, data = ausgabenReshape[,c('Datum','Ausgaben')], sum)
proTag$Ausgaben = cumsum(proTag$Ausgaben)
for (name in levels(ausgabenReshape$Name))
{
    persTag = ausgabenReshape[ausgabenReshape$Name==name,c('Datum','Ausgaben')]$Ausgaben
    proTag[name] = cumsum(persTag)
}

g=c('Ausgabe', levels(ausgabenReshape$Name))
longTb = melt(proTag, id.vars = "Datum")
ggplot(data=longTb, aes(x=Datum, y=value, group=variable, color=variable)) + 
    geom_line() + geom_point() +
    ylab("Ausgaben in €") +
    ggtitle("kummulierte Ausgaben")

## Summe Augaben pro Person
###########################
summen = data.frame( Name=character(), Summe=numeric() )
for (name in levels(ausgabenReshape$Name))
{
    geldSumme = sum(ausgabenReshape[ausgabenReshape$Name==name,"Ausgaben"])
    summen = rbind(summen, data.frame(Name = name, Summe = geldSumme ) )
}

# differenz plot
ggplot(summen, aes(x=Name,y=Summe, fill=Name)) + geom_bar(stat="identity", position=position_dodge()) +
    ylab("Summe in €") +
    ggtitle("Summe aller Ausgaben p.P.")

# differenz
diff(summen$Summe)

dev.off()
