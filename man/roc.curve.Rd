\name{roc.curve}
\alias{roc.curve}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
ROC curve
}
\description{
Computes the area under the receiver operating characteristics (ROC) curve for weighted and unweighted data.
In addition to the area under the curve, the curve can be obtained by setting argument \code{curve} to \code{TRUE}.
}
\usage{
roc.curve( scores.class0, scores.class1=scores.class0, weights.class0=NULL, 
    weights.class1 = {if(is.null(weights.class0)){NULL}else{1-weights.class0}}, 
    sorted = FALSE, curve = FALSE, 
    max.compute=F, min.compute=F, rand.compute=F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{scores.class0}{the classification scores of i) all data points or ii) only the data points belonging to the positive class.

      In the first case, scores.class1 should not be assigned an explicit value, but left at the default (scores.class1=scores.class0). 
      In addition, weights.class0 needs to contain the class labels of the data points (1 for positive class, 0 for negative class) or 
      the soft-labels for the positive class, i.e., the probability for each data point to belong to the positive class. 
      Accordingly, weights.class1 should be left at the default value (1-weights.class0).

      In the second case, the scores for the negative data points need to be provided in scores.class1. In this case, weights.class0 and weights.class1
      need to be provided only for soft-labelling and should be of the same length as scores.class0 and scores.class1, respectively.}
  \item{scores.class1}{the scores of the negative class if provided separately (see scores.class0)}
  \item{weights.class0}{the weights for the data points of the positive class in same ordering as \code{scores.class0} (optional)}
  \item{weights.class1}{the weights for the data points of the negative class in same ordering as \code{scores.class1} (optional)}
  \item{sorted}{\code{TRUE} if the scores are already sorted}
  \item{curve}{\code{TRUE} if the curve should also be returned, \code{FALSE} otherwise}
  \item{max.compute}{\code{TRUE} if the maximum ROC curve given the supplied weights should be computed}
  \item{min.compute}{\code{TRUE} if the minimum ROC curve given the supplied weights should be computed}
  \item{rand.compute}{\code{TRUE} if the ROC curve of a random classifier given the supplied weights should be computed}
}
\details{
This function computes the area under a receiver-operating characteristic (ROC) curve and, optionally, the curve itself and returns it as a \code{PRROC} object (see below).
It can be used under different scenarios:

1. Standard, hard-labeled classification problems:

Each data point is uniquely assigned to one out of two possible classes. In this case, the classification scores may be either provided separately
for the data points of each of the classes, i.e., as \code{scores.class0} for the data points from the positive/foreground class and as \code{scores.class1}
for the data points of the negative/background class; or the classification scores for all data points are provided as \code{scores.class0} and the labels
are provided as numerical values (\code{1} for the positive class, \code{0} for the negative class)  as \code{weights.class0}.

2. Weighted, hard-labeled classification problems:

Each data point is uniquely assigned to one out of two possible classes, where each data points additionally has a weight assigned, for instance
multiplicities in the original data set. In this case, the classification scores need to be provided separately
for the data points of each of the classes, i.e., as \code{scores.class0} for the data points from the positive/foreground class and as \code{scores.class1}
for the data points of the negative/background class. In addition, the weights for the data points must be provided as \code{weights.class0} and \code{weights.class1}, respectively.

3. Soft-labeled classification problems:

Each data point belongs to both of the two classes with a certain probability, where for each data point, these two probabilities add up to 1.
In this case, the classification scores for all data points need to be provided only once as \code{scores.class0} and only the positive/foreground weights for each data point need to be provided in \code{weights.class0}, while the converse probability for the negative class is automatically set to
\code{weights.class1=1.0-weights.class0}.
}
\value{
	\item{type}{always \code{"ROC"}}
	\item{auc}{area under the curve}
	\item{curve}{the ROC curve as a matrix, where the first column contains the false-positive rate, the second contains recall (sensitivity), and the third contains the corresponding threshold on the scores.}
  \item{max}{the maximum ROC curve (if \code{max.compute=TRUE})}
  \item{min}{the minimum ROC curve (if \code{min.compute=TRUE})}
  \item{rand}{the ROC curve of a random classifier (if \code{rand.compute=TRUE})}
}
\references{
J. Keilwagen, I. Grosse, and J. Grau. Area under precision-recall curves for weighted and unweighted data, PLOS ONE (9) 3, 2014.

}
\author{
Jan Grau and Jens Keilwagen
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{pr.curve}}

\code{\link{plot.PRROC}}
}
\examples{
# create artificial scores as random numbers
x <- rnorm( 1000 );
y <- rnorm( 1000, -1 );
# compute area under ROC curve for the hard-labeled case
roc <- roc.curve( x, y );
print( roc );

# compute ROC curve and area under curve
roc <- roc.curve( x, y, curve = TRUE );
# plot curve
plot(roc);


# create artificial weights
x.weights <- runif( 1000 );
y.weights <- runif( 1000 );

# compute ROC curve and area under curve for weighted, hard-labeled data
roc <- roc.curve( x, y, x.weights, y.weights, curve = TRUE );
# and plot the curve
plot(roc);


# compute ROC curve and area under curve,
# and maximum, minimum, and random ROC curve for weighted, hard-labeled data
roc <- roc.curve(x, y, x.weights, y.weights, curve = TRUE, max.compute = TRUE, 
  min.compute = TRUE, rand.compute = TRUE);
# plot all three curves
plot(roc, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE)


# concatenate the drawn scores
scores<-c(x,y);
# and create artificial soft-labels
weights<-c(runif(1000, min = 0.5, max = 1), runif(1000, min = 0, max = 0.5))

# compute ROC curve and area under curve,
# and maximum, minimum, and random ROC curve  for soft-labeled data
roc<-roc.curve(scores.class0 = scores, weights.class0 = weights, curve = TRUE, 
  max.compute = TRUE, min.compute = TRUE, rand.compute = TRUE);
# plot all three curves
plot(roc, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE)

# print the areas under the curves
print(roc);

# generate classification scores of a second classifier
scores.2<-c(rnorm( 1000 ),rnorm( 1000, -2 ));
# and compute the ROC curve
roc.2<-roc.curve(scores.class0 = scores.2, weights.class0 = weights, curve = TRUE)
# plot all three curves for the first classifier in red
plot(roc, max.plot = TRUE, min.plot = TRUE, rand.plot = TRUE, fill.area = TRUE, 
  color="red", auc.main=FALSE)
# and add the curve for the second classifier
plot(roc.2, add=TRUE, color="green")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the R documentation directory.
\keyword{ classif }