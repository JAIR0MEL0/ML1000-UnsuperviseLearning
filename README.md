# Unsupervised Learning - 
This is a training tutorial of the Unsupervised Learning Algorithms focus on Clustering.  The study we will be using is the Wine Reviews dataset.  We will be following the CRISP-MD menthodology.

## Business Understanding

Hypothesis building : Identify all possible variables that can help us segment the data reviews regardless of its availability. Lets try to come up with a list for this example.

a. Chardonnay is mainly consume because the price

b. Merlot has great potential to be reintroduced in the US market

c. Malbec from South America (Chile) is more pupolar than from US or Europe because the Quality

d. Local wineries have more success producing wines because the low price

e. Tempranillos is the best cheap wine to sale because its flavor

f. Is Pinot Noir from France a good candidate for import or should we replace it

## Data Understanding:
We will use as Data set a review of the Wines with different variarities across different regions and providence.
https://www.kaggle.com/zynicide/wine-reviews
Due to the large number set, we will extract a subset to increase computing power


## Data Preparation
Below are the main recommendations for using Hierarchical Clustering analysis:
1. Rows are observations (individuals) and columns are variables
2. Any missing value in the data must be removed or estimated.
3. The data must be standardized (i.e., scaled) to make variables comparable.


# Modeling

## K-Mode


## K-Means



# Hierarchical Clustering Analysis
Hierarchical clustering can be divided into two main types: agglomerative and divisive.

## Agglomerative clustering:
Or AGNES (Agglomerative Nesting) works in a bottom-up manner. That is, each object is initially considered as a single-element cluster (leaf). At each step of the algorithm, the two clusters that are the most similar are combined into a new bigger cluster (nodes). Agglomerative clustering is good at identifying small clusters.

## Divisive hierarchical clustering:
Or DIANA (Divise Analysis) works in a top-down manner. The algorithm is an inverse order of AGNES. It begins with the root, in which all objects are included in a single cluster. At each step of iteration, the most heterogeneous cluster is divided into two. The process is iterated until all objects are in their own cluster.  Divisive hierarchical clustering is good at identifying large clusters.  

Wine Review Case study hjas a large number of observartions which makes a great candidate for the Divisive Hierchical clustery analysis.

# The Objective

To uncover patterns in these reviews (if any).


## How do we measure the dissimilarity between two clusters of observations? 
There are different cluster agglomeration methods (i.e, linkage methods) developed to answer to this question.

The most common types methods are:

Maximum or complete linkage clustering: It computes all pairwise dissimilarities between the elements in cluster 1 and the elements in cluster 2, and considers the largest value (i.e., maximum value) of these dissimilarities as the distance between the two clusters. It tends to produce more compact clusters.

Minimum or single linkage clustering: It computes all pairwise dissimilarities between the elements in cluster 1 and the elements in cluster 2, and considers the smallest of these dissimilarities as a linkage criterion. It tends to produce long, “loose” clusters.

Mean or average linkage clustering: It computes all pairwise dissimilarities between the elements in cluster 1 and the elements in cluster 2, and considers the average of these dissimilarities as the distance between the two clusters.

Centroid linkage clustering: It computes the dissimilarity between the centroid for cluster 1 (a mean vector of length p variables) and the centroid for cluster 2.
Ward’s minimum variance method: It minimizes the total within-cluster variance. At each step the pair of clusters with minimum between-cluster distance are merged.

# Evaluation
Let's determine the optimal clusters:

## Using Elbow Method
The basic idea behind cluster partitioning methods is to define clusters such that the total intra-cluster variation (known as total within-cluster variation or total within-cluster sum of square) is minimized.

The total within-cluster sum of square (wss) measures the compactness of the clustering and we want it to be as small as possible. So, we can use the following algorithm to define the optimal clusters:

Compute clustering algorithm (e.g., hierarchical clustering or k-means) for different values of k. For instance, by varying k from 1 to 10 clusters
For each k, calculate the total within-cluster sum of square (wss)
Plot the curve of wss according to the number of clusters k.
The location of a bend (knee) in the plot is generally considered as an indicator of the appropriate number of clusters.

## Average Silhouette Method
The average silhouette measures the quality of a clustering determining how well each object lies within its cluster.

A high average silhouette width indicates a good clustering. The average silhouette method computes the average silhouette of observations for different values of k. The optimal number of clusters k is the one that maximizes the average silhouette over a range of possible values for k.2

We can use the silhouette function in the cluster package to compuate the average silhouette width. The following code computes this approach for 1-15 clusters. The results show that 2 clusters maximize the average silhouette values with 4 clusters coming in as second optimal number of clusters.

## Gap Statistic Method
The gap statistic has been published by R. Tibshirani, G. Walther, and T. Hastie (Standford University, 2001). The approach can be applied to any clustering method (i.e. K-means clustering, hierarchical clustering). The gap statistic compares the total intracluster variation for different values of k with their expected values under null reference distribution of the data (i.e. a distribution with no obvious clustering). The reference dataset is generated using Monte Carlo simulations of the sampling process. That is, for each variable (xi), in the data set we compute its range, [min(xi),max(xj)] and generate values for the n points uniformly from the interval min to max.



## Convergence of clusters
A good criteria to select clusters is selecting the clusters with population between 5-30% of the overall base. 
If any of the cluster is beyond the limit then we repeat the procedure with additional number of variables or a a different Clustering Algotithm for example K-mode, K-Means or Hierarchical Clustering.

## Profiling of the clusters
After validating the convergence of cluster analysis, we need to identify behavior of each cluster. Lets say we map Points and Price to each of the four clusters.

------------------------------------------
Cluster|  Point Range |    Price Range   |
------------------------------------------
1      |   40-50      |    200-300       |
------------------------------------------
2      |   60-90      |    400-600       |
------------------------------------------
3      |   90-        |    700-800       |





# Conclusion
Clustering is a very useful tool for data analysis in the unsupervised setting.
Bellow are some items we must consider while performing hierarchical clustering analysis.

1. What dissimilarity measure should be used?
2. What type of linkage should be used?
3. Where should we cut the dendrogram in order to obtain clusters?

#Each decision has a strong impact on the results obtained.

## In practice
We try several different choices, and look for the one with the most useful or 
#interpretable solution. With these methods, there is no single right answer - any solution 
#that exposes some interesting aspects of the data should be considered.

# Deployment
