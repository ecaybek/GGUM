% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Accessory.R
\name{GenData.GGUM}
\alias{GenData.GGUM}
\title{Generate data from the GUM/GGUM}
\usage{
GenData.GGUM(N, I, C, xi = 1, model = "GGUM", seed = 123)
}
\arguments{
\item{N}{Number of persons (rows).}

\item{I}{Number of items (columns).}

\item{C}{\eqn{C} is the number of observable response categories minus 1 
(i.e., the item scores will be in the set \eqn{\{0, 1, ..., C\}}{{0, 1, 
..., C}}). It should either be a vector of \eqn{I} elements or a scalar. In
the latter, case it is assumed that \eqn{C} applies to all items.}

\item{xi}{Skewness parameter}

\item{model}{A string identifying the model. Possible values are "GUM" or 
"GGUM" (default).}

\item{seed}{An integer, allowing the user to control the generation process 
(for replication purposes).}
}
\value{
The function returns a list with five elements: \item{alpha.gen}{The 
  discrimination parameters.} \item{delta.gen}{The difficulty parameters.} 
  \item{taus.gen}{The threshold parameters.} \item{theta.gen}{The person 
  parameters.} \item{data}{The (NxI) data matrix. The item scores are coded 
  0, 1, ..., C for an item with (C+1) observable response categories.}
}
\description{
\code{GenData.GGUM} generates all model parameters (items and 
  persons) and item scores.
}
\section{Details}{
 The generalized graded unfolding model (GGUM; Roberts & 
  Laughlin, 1996; Roberts et al., 2000) is given by \deqn{P(Z_i=z|\theta_n) =
  \frac{f(z) + f(M-z)}{\sum_{w=0}^C\left[f(w)+f(M-w)\right]}, }{P(Z_i = 
  z|t_n) = ( f(z) + f(M-z) ) / (sum( f(w) + f(M - w); w = 0, ..., C )),}
  
  \deqn{f(w) = exp\left\{\alpha_i\left[w(\theta_n-\delta_i)- 
  \sum_{k=0}^w\tau_{ik}\right]\right\}, }{f(w) = exp( alpha_i ( w(t_n - 
  delta_i) - sum( tau_ik; k = 0, ..., w) ) ),}
  
  where: \itemize{ \item The subscripts \eqn{i} and \eqn{n} identify the item
  and person, respectively. \item \eqn{z=0,\ldots,C}{z = 0, ..., C} denotes 
  the observed answer response. \item \eqn{M = 2C + 1} is the number of 
  subjective response options minus 1. \item \eqn{\theta_n}{t_n} is the 
  latent trait score for person \eqn{n}. \item \eqn{\alpha_i}{alpha_i} is the
  item slope (discrimination). \item \eqn{\delta_i}{delta_i} is the item 
  location. \item \eqn{\tau_{ik}}{tau_ik} (\eqn{k=1,\ldots,M}{k = 1, ..., M} 
  ) are the threshold parameters. }
  
  Parameter \eqn{\tau_{i0}}{tau_i0} is arbitrarily constrained to zero and 
  the threshold parameters are constrained to symmetry around zero, that is, 
  \eqn{\tau_{i(C+1)}=0}{tau_{i(C+1)} = 0} and 
  \eqn{\tau_{iz}=-\tau_{i(M-z+1)}}{tau_{iz} = -tau_{i(M-z+1)}} for 
  \eqn{z\not= 0}{z != 0}.
  
  Parameters \eqn{\alpha_i}{alpha_i} are randomly uniformly drawn from the 
  (.5, 2) interval. Parameters \eqn{\delta_i}{delta_i} are randomly drawn 
  from the standard normal distribution bounded between \eqn{-2} and 2. The 
  threshold parameters are generated following the same procedure of Roberts,
  Donoghue, and Laughlin (2002). Finally, the person parameters are randomly 
  drawn from the standard normal distribution.
  
  If \code{model = "GUM"} the data based on the GUM (Roberts and Laughlin, 
  1996) model are generated. The GUM is a constrained version of the GGUM, 
  where all discrimination parameters are equal to 1 and the item thresholds
  are shared by all items.
}

\examples{
gen1 <- GenData.GGUM(500, 10, 5, seed = 456)
gen1$data      # Retrieve the data.
gen1$alpha.gen # The discrimination parameters.

# Generate data based on items varying in the number of observable response categories:
gen2 <- GenData.GGUM(500, 5, c(5, 5, 5, 4, 4), seed = 789)

}
\author{
Jorge N. Tendeiro, \email{tendeiro@hiroshima-u.ac.jp}
}
