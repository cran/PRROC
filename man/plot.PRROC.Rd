\name{plot.PRROC}
\alias{plot.PRROC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plotting PRROC objects
}
\description{
Plots the PR or ROC curves of a PRROC object. To obtain such curves, \code{pr.curve} or \code{roc.curve} must be called with
argument \code{curve=TRUE}.
}
\usage{
\method{plot}{PRROC}(x, xlim=c(0,1), ylim=c(0,1), auc.main=TRUE, 
    auc.type=c("integral","davis.goadrich"), 
    legend=ifelse(is.logical(color) & color==TRUE,4,NA), xlab=NULL, ylab=NULL, 
    main=NULL, color=TRUE, lwd=3, add=FALSE, 
    scale.color=hsv(h=seq(0,1,length=100)*0.8, s=1, v=1), 
    max.plot = FALSE, min.plot = FALSE, rand.plot = FALSE, 
    fill.area = (max.plot & min.plot), maxminrand.col = grey(0.5), 
    fill.color = grey(0.95), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a PRROC object obtained from \code{\link{pr.curve}} or \code{\link{roc.curve}}}
  \item{xlim}{as in \code{plot}}
  \item{ylim}{as in \code{plot}}
  \item{auc.main}{\code{TRUE} to show the area under curve in the title}
  \item{auc.type}{the area under the curve shown in the title (see also \code{pr.curve}). Ignored if \code{auc.main=FALSE} or \code{x$type=="ROC"}.}
  \item{legend}{if \code{TRUE} (and \code{color==TRUE}), a legend for the color scheme for the scores is shown on the right side of the main plot. 
       If \code{legend} is a number between 1 and 4, the legend is drawn on the correspond side of the main plot (see \code{\link{axis}}). If \code{legend}
       is \code{FALSE} or \code{NA}, no legend is drawn.}
  \item{xlab}{the label of the x-axis. If \code{NULL}, label is chosen according the kind of the curve.}
  \item{ylab}{the label of the y-axis. If \code{NULL}, label is chosen according the kind of the curve.}
  \item{main}{the title of the plot. If \code{NULL}, title is chosen according the kind of the curve.}
  \item{color}{if \code{TRUE}, curve is plotted in colors reflecting score thresholds, 
       if \code{FALSE}, the curve is plotted in black, 
       if a color value (e.g., \code{2} or \code{"red"} for red) the curve is plotted in that color. 
       For everything different from \code{TRUE}, the legend is omitted irrespective of the value of argument \code{legend}}
  \item{lwd}{the line width of the curve}
  \item{add}{if \code{TRUE}, the curve is added to an existing plot. Only works correctly, if in the previous call (with \code{add==FALSE}), no legend has been added to the plot.}
  \item{scale.color}{vector of colors that are used to reflect score thresholds, compare \code{color}}
  \item{max.plot}{if \code{TRUE} and \code{x} has been computed including the maximum curve, plot this maximum curve (ignored if \code{add=TRUE})}
  \item{min.plot}{if \code{TRUE} and \code{x} has been computed including the minimum curve, plot this maximum curve (ignored if \code{add=TRUE})}
  \item{rand.plot}{if \code{TRUE} and \code{x} has been computed including the curve of a random classifier, plot this curve (ignored if \code{add=TRUE})}
  \item{fill.area}{fill the area between maximum and minimum curve (given both have been computed for \code{x}) (ignored if \code{add=TRUE})}
  \item{maxminrand.col}{the plot color for the maximum, minimum, and random curves}
  \item{fill.color}{the fill color for the area between minimum and maximum curve}
  \item{\dots}{see \code{plot}}
}
\details{

The \code{plot} method for PRROC objects can be used in different ways. 

The first is to plot a visualization of a single ROC or PR curve
that also represents the classification thresholds of individual points on the curve by a color scale. 
In this case, a \code{PRROC} object must be provided as \code{x}, \code{add} must be \code{FALSE}, and \code{color} must be \code{TRUE}. 
If, in addition, \code{legend} is set to \code{TRUE}, a legend translating colors to numerical threshold values is included to the right of the curve plot
itself. The layout of curve plot and legend is accomplished using \code{layout()}, which means that this type of ROC/PR plot cannot be combined
with other/complex layouts.

The second application of the \code{plot} method is to compare the performance of different classifiers (typically on the same data set). To do so,
\code{plot} must be called with \code{add=FALSE} and \code{color} set to one specific color (e.g., 2, "red",...) for the first \code{PRROC} object
provided as \code{x}. Subsequent calls of \code{plot} with \code{add=TRUE} can be used to add further curves to the first plot, where different colors
may be specified by the \code{color} parameter.

In both cases, the first (or only) call to \code{plot} also allows for including plots of the maximum and minimum curve, 
highlighting the area between minimum and maximum, and the curve of a random classifier. 
For this purpose, the \code{PRROC} object needs to be created (using \code{\link{pr.curve}} or \code{\link{roc.curve}}) with the corresponding
parameters (e.g., \code{max.compute}) set to \code{TRUE}.

Additional examples for the different use cases and corresponding plot commands are given in the documentations of \code{\link{pr.curve}} and \code{\link{roc.curve}}.

}

\author{
Jan Grau and Jens Keilwagen
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{pr.curve}}

\code{\link{roc.curve}}
}
\examples{
# create artificial scores as random numbers
x <- rnorm( 1000 );
y <- rnorm( 1000, -1 );

# compute PR curve
pr <- pr.curve( x, y, curve = TRUE );

# standard plot of PR curve
plot( pr );

# compute ROC curve
roc <- roc.curve( x, y, curve = TRUE );

# standard plot of ROC curve
plot( roc );

# create another set of scores
x.2 <- rnorm( 1000 );
y.2 <- rnorm( 1000, -2 );

# compute PR curve
pr.2 <- pr.curve( x.2, y.2, curve=TRUE );
# and ROC curve
roc.2 <- roc.curve( x.2, y.2, curve=TRUE );

# plot PR curve in red, without legend
plot( pr, color = "red", auc.main=FALSE );
# add second PR curve in green
plot( pr.2, color = 3, add = TRUE );


# plot ROC curve in red, without legend
plot( roc, color = "red", auc.main=FALSE);
# add second ROC curve in green
plot( roc.2, color = 3, add = TRUE );

# plot PR curve with legend below the main plot
plot( pr, legend=1 );

# compute PR curve with minimum and maximum curve, and random classifier
pr <- pr.curve( x, y, curve = TRUE, max.compute = TRUE, 
  min.compute = TRUE, rand.compute = TRUE);

# plot PR curve with area between minimum and 
# maximum curve in green and random classifier in blue
plot(pr, rand.plot = TRUE, fill.area = TRUE, fill.color = rgb(0.8,1,0.8), 
  maxminrand.col = "blue" );


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ hplot }
