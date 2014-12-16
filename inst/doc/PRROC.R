### R code from vignette source 'PRROC.Rnw'

###################################################
### code chunk number 1: PRROC.Rnw:32-33
###################################################
library(PRROC)


###################################################
### code chunk number 2: PRROC.Rnw:43-45
###################################################
fg<-rnorm(300);
bg<-rnorm(500,-2);


###################################################
### code chunk number 3: PRROC.Rnw:51-53
###################################################
roc<-roc.curve(scores.class0 = fg, scores.class1 = bg)
pr<-pr.curve(scores.class0 = fg, scores.class1 = bg)


###################################################
### code chunk number 4: PRROC.Rnw:57-58
###################################################
roc


###################################################
### code chunk number 5: PRROC.Rnw:63-64
###################################################
pr


###################################################
### code chunk number 6: PRROC.Rnw:69-71
###################################################
roc<-roc.curve(scores.class0 = fg, scores.class1 = bg, curve = TRUE)
pr<-pr.curve(scores.class0 = fg, scores.class1 = bg, curve = TRUE)


###################################################
### code chunk number 7: PRROC.Rnw:75-77
###################################################
roc
pr


###################################################
### code chunk number 8: roc
###################################################
plot(roc)


###################################################
### code chunk number 9: PRROC.Rnw:88-89
###################################################
plot(roc)


###################################################
### code chunk number 10: pr
###################################################
plot(pr)


###################################################
### code chunk number 11: PRROC.Rnw:100-101
###################################################
plot(pr)


###################################################
### code chunk number 12: PRROC.Rnw:111-113
###################################################
x<-c(fg,bg);
lab<-c(rep(1,length(fg)),rep(0,length(bg)))


###################################################
### code chunk number 13: PRROC.Rnw:118-120
###################################################
roc<-roc.curve(scores.class0 = x, weights.class0 = lab);
pr<-pr.curve(scores.class0 = x, weights.class0 = lab);


###################################################
### code chunk number 14: PRROC.Rnw:125-127
###################################################
roc
pr


###################################################
### code chunk number 15: PRROC.Rnw:142-143
###################################################
wfg<- c(runif(300,min=0.5,max=1),runif(500,min=0,max=0.5))


###################################################
### code chunk number 16: PRROC.Rnw:148-150
###################################################
hist(wfg[301:800],col=2,xlim=c(0,1),main="Weights",xlab="foreground weight");
hist(wfg[1:300],col=3,add=T);


###################################################
### code chunk number 17: PRROC.Rnw:157-159
###################################################
wroc<-roc.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE)
wpr<-pr.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE)


###################################################
### code chunk number 18: PRROC.Rnw:165-169
###################################################
wroc<-roc.curve(scores.class0 = x, scores.class1 = x, 
  weights.class0 = wfg, weights.class1 = 1-wfg, curve = TRUE)
wpr<-pr.curve(scores.class0 = x, scores.class1 = x, 
  weights.class0 = wfg,weights.class1 = 1-wfg, curve = TRUE)


###################################################
### code chunk number 19: wroc
###################################################
plot(wroc)


###################################################
### code chunk number 20: PRROC.Rnw:178-179
###################################################
plot(wroc)


###################################################
### code chunk number 21: wpr
###################################################
plot(wpr)


###################################################
### code chunk number 22: PRROC.Rnw:189-190
###################################################
plot(wpr)


###################################################
### code chunk number 23: PRROC.Rnw:199-203
###################################################
wpr<-pr.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE, 
  max.compute = T, min.compute = T, rand.compute = T)
wroc<-roc.curve(scores.class0 = x, weights.class0 = wfg, curve = TRUE, 
  max.compute = T, min.compute = T, rand.compute = T)


###################################################
### code chunk number 24: PRROC.Rnw:208-210
###################################################
wpr
wroc


###################################################
### code chunk number 25: wpr2
###################################################
plot(wpr,max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, 
  fill.area = TRUE)


###################################################
### code chunk number 26: PRROC.Rnw:221-222
###################################################
plot(wpr,max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, 
  fill.area = TRUE)


###################################################
### code chunk number 27: PRROC.Rnw:229-235
###################################################
y<-c(rnorm(300,sd=2),rnorm(500,-5,sd=2))

wpr2<-pr.curve(scores.class0 = y, weights.class0 = wfg, curve = TRUE, 
  max.compute = TRUE, min.compute = TRUE, rand.compute = TRUE)
wroc2<-roc.curve(scores.class0 = y, weights.class0 = wfg, curve = TRUE, 
  max.compute = TRUE, min.compute = TRUE, rand.compute = TRUE)


###################################################
### code chunk number 28: PRROC.Rnw:240-242
###################################################
plot(wpr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, 
  fill.area = T, color=2, auc.main = FALSE);


###################################################
### code chunk number 29: PRROC.Rnw:246-247
###################################################
plot(wpr2, add = TRUE, color = 3);


###################################################
### code chunk number 30: PRROC.Rnw:252-254
###################################################
plot(wpr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = T, color=2, auc.main = FALSE);
plot(wpr2, add = TRUE, color = 3);


###################################################
### code chunk number 31: plot1
###################################################
plot(wpr,scale.color = heat.colors(100));


###################################################
### code chunk number 32: PRROC.Rnw:270-271
###################################################
plot(wpr,scale.color = heat.colors(100));


###################################################
### code chunk number 33: plot2
###################################################
plot(wpr, auc.main = FALSE, main = "My classifier")


###################################################
### code chunk number 34: PRROC.Rnw:281-282
###################################################
plot(wpr, auc.main = FALSE, main = "My classifier")


###################################################
### code chunk number 35: plot6
###################################################
plot(wpr, legend = FALSE)


###################################################
### code chunk number 36: PRROC.Rnw:292-293
###################################################
plot(wpr, legend = FALSE)


###################################################
### code chunk number 37: plot3
###################################################
plot(wpr, color=3, lty="dotted");


###################################################
### code chunk number 38: PRROC.Rnw:303-304
###################################################
plot(wpr, color=3, lty="dotted");


###################################################
### code chunk number 39: plot4
###################################################
plot(wpr,legend=1);


###################################################
### code chunk number 40: PRROC.Rnw:314-315
###################################################
plot(wpr,legend=1);


###################################################
### code chunk number 41: plot5
###################################################
plot(wpr, rand.plot = TRUE, fill.area = TRUE, 
  fill.color = rgb(0.8,1,0.8), maxminrand.col = "blue" );


###################################################
### code chunk number 42: PRROC.Rnw:326-327
###################################################
plot(wpr, rand.plot = TRUE, fill.area = TRUE, 
  fill.color = rgb(0.8,1,0.8), maxminrand.col = "blue" );


