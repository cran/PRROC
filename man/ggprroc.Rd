\name{ggprroc}
\alias{ggprroc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plotting PRROC objects using ggplot2
}
\description{
Plots the PR or ROC curves of a PRROC object using ggplot2. To obtain such curves, \code{pr.curve} or \code{roc.curve} must be called with
argument \code{curve=TRUE}.
}
\usage{
ggprroc(x, auc.main=TRUE, auc.type=c("integral","davis.goadrich"),
    xlab=NULL,ylab=NULL,
    main=NULL,
    max.plot = FALSE, min.plot = FALSE, rand.plot = FALSE,
    fill.area = (max.plot & min.plot))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a PRROC object obtained from \code{\link{pr.curve}} or \code{\link{roc.curve}}}
  \item{auc.main}{\code{TRUE} to show the area under curve in the title}
  \item{auc.type}{the area under the curve shown in the title (see also \code{pr.curve}). Ignored if \code{auc.main=FALSE} or \code{x$type=="ROC"}.}
  \item{xlab}{the label of the x-axis. If \code{NULL}, label is chosen according the kind of the curve.}
  \item{ylab}{the label of the y-axis. If \code{NULL}, label is chosen according the kind of the curve.}
  \item{main}{the title of the plot. If \code{NULL}, title is chosen according the kind of the curve.}
  \item{max.plot}{if \code{TRUE} and \code{x} has been computed including the maximum curve, plot this maximum curve}
  \item{min.plot}{if \code{TRUE} and \code{x} has been computed including the minimum curve, plot this maximum curve}
  \item{rand.plot}{if \code{TRUE} and \code{x} has been computed including the curve of a random classifier, plot this curve}
  \item{fill.area}{fill the area between maximum and minimum curve (given both have been computed for \code{x}) (ignored if \code{add=TRUE})}
}
\details{

This function plots PRROC objects as a curve using ggplot2, specifically \code{geom_line}. If minimum, maximum or random curves have been computed, these can be added to the plot.

The function returns a ggplot2 object that may be further modified using themes, scales on the colours, etc.
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
ggprroc( pr );

# compute ROC curve
roc <- roc.curve( x, y, curve = TRUE );

# standard plot of ROC curve
ggprroc( roc );


# include maximum, minimum and random curves
pr <- pr.curve( x, y, curve = TRUE, max.compute = TRUE, 
    min.compute = TRUE, rand.compute = TRUE );
    
ggprroc( pr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE )


# modify theme and colour scale

pl <- ggprroc( pr, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE )


if(require(ggplot2)){
  pl + scale_color_viridis_c(option="D",name="Some score") +
      xlab("Sensitivity")+
      theme_gray()
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ hplot }
