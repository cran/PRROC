\name{PRROC-package}
\alias{PRROC-package}
\alias{PRROC}
\docType{package}
\title{Compute and plot PR and ROC curves and the areas under the curves for weighted and unweighted data}
\description{
This package computes the areas under the precision-recall (PR) and receiver operating characteristics (ROC) curve for weighted (e.g., soft-labeled) and unweighted data. In contrast to other implementations, the interpolation between points of the PR curve is done by a non-linear piecewise function. In addition to the areas under the curves, the curves themselves can also be computed and plotted by a specific S3-method.
}
\details{
\tabular{ll}{
Package: \tab PRROC\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-11-04\cr
License: \tab \href{http://www.r-project.org/Licenses/GPL-3}{GPL-3}\cr
}

}
\author{
Jan Grau and Jens Keilwagen

Maintainer: Jan Grau <grau@informatik.uni-halle.de>
}
\references{
J. Davis and M. Goadrich. The relationship between precision-recall and ROC curves.
In \emph{ ICML '06: Proceedings of the 23rd international conference on Machine learning}, pages 233--240, New York, NY, USA, 2006. ACM.

T. Fawcett, An introduction to ROC analysis, Pattern Recognition Letters (27) 8, 861-874, 2006.

J. Keilwagen, I. Grosse, and J. Grau. Area under Precision-Recall Curves for Weighted and Unweighted Data, PLOS ONE (9) 3, 2014.
}
\keyword{ package }
\seealso{
\code{\link{pr.curve}}

\code{\link{roc.curve}}

\code{\link{plot.PRROC}}

\code{\link{print.PRROC}}
}
\examples{
# create artificial scores as random numbers
x <- rnorm( 1000 );
y <- rnorm( 1000, -1 );

# compute area under PR curve
pr <- pr.curve( x, y );
print( pr );

# compute area under ROC curve
roc <- roc.curve( x, y );
print( roc );

# compute PR curve and area under curve
pr <- pr.curve( x, y, curve = TRUE );
# plot curve
plot(pr);

# compute ROC curve and area under curve
roc <- roc.curve( x, y, curve = TRUE );
# plot curve
plot(roc);

# create artificial weights
x.weights <- runif( 1000 );
y.weights <- runif( 1000 );

# compute PR curve and area under curve
pr <- pr.curve( x, y, x.weights, y.weights, curve = TRUE );
# plot curve
plot(pr);

# compute ROC curve and area under curve
roc <- roc.curve( x, y, x.weights, y.weights, curve = TRUE );
# plot curve
plot(roc);
}
