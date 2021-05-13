library(ggplot2)
library(scales)

data(economics,package = "ggplot2")
data(presidential, package = "ggplot2")
# Basic line plot with points
p <- ggplot(data=economics, aes(x=date, y=uempmed)) +geom_line()+scale_x_date(limit=c(as.Date("1960-01-01"),as.Date("2020-02-11"))) +ylim(0,25)
p


q <- ggplot(data=presidential,aes(x=duration,y=,fill=party,alpha=0.3))+geom_col(aes(col=party))                                                                 
q

View(presidential)


presidential$duration <- presidential$end-presidential$start
presidential$duration <- round(as.numeric(presidential$duration)/365,1)


yrng <- range(economics$unemploy)
p <- p +geom_rect(aes(NULL, NULL, xmin = start, xmax = end, fill = party),
                 ymin = yrng[1], ymax = yrng[2], data = presidential)
p

#######################################
p <- ggplot(economics, aes(x = date, y = unemploy)) + geom_line()
p

yrng <- range(economics$unemploy)
p <- p + geom_rect(aes(NULL, NULL, xmin = start, xmax = end, fill = party),
                   ymin = yrng[1], ymax = yrng[2], data = presidential)
p

p + scale_fill_manual(values = alpha(c("blue", "red"), .2))

