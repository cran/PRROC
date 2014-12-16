\name{print.PRROC}
\alias{print.PRROC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
printing PRROC objects
}
\description{
Prints a PRROC object.
}
\usage{
\method{print}{PRROC}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a PRROC object obtained from \code{\link{pr.curve}} or \code{\link{roc.curve}}}
  \item{\dots}{see \code{\link{print}}}
}
\details{
%%  ~~ If necessary, more details than the description above ~~

The print method for PRROC objects prints the area under the (PR or ROC) curve, and (if \code{curve=TRUE} in \code{\link{pr.curve}} or \code{\link{roc.curve}}) the range of classification scores. If also \code{max.compute=TRUE}, \code{min.compute=TRUE}, and/or \code{rand.compute=TRUE} when the PRROC object has been computes using \code{\link{pr.curve}} or \code{\link{roc.curve}}, a relative area under curve is reported, i.e., the minimal AUC subtracted from the original AUC and the result divided by the difference of maximum and minimum AUC.
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
# compute area under PR curve
pr <- pr.curve( x, y );
print( pr );

# compute area under ROC curve
roc <- roc.curve( x, y );
print( roc );
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ print }
