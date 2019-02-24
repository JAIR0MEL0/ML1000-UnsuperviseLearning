# Unsupervised Learning - Hierarchical Clustering Analysis

This is a Unsupervised Tutorial Training of Hierarchical Clustering using application of with Wine Reviews

## Source of the Data:
We will use as Data set a review of the Wines with different variarities across different regions and providence.
https://www.kaggle.com/zynicide/wine-reviews
Due to the large number set, we will extract a subset to increase computing power

# Concepts for Hierarchical Clustering Algorithms

Hierarchical clustering can be divided into two main types: agglomerative and divisive.

## Agglomerative clustering:
It’s also known as AGNES (Agglomerative Nesting). It works in a bottom-up manner. That is, each object is initially considered as a single-element cluster (leaf). At each step of the algorithm, the two clusters that are the most similar are combined into a new bigger cluster (nodes). This procedure is iterated until all points are member of just one single big cluster (root) (see figure below). The result is a tree which can be plotted as a dendrogram.

Agglomerative clustering is good at identifying small clusters.

## Divisive hierarchical clustering:
It’s also known as DIANA (Divise Analysis) and it works in a top-down manner. The algorithm is an inverse order of AGNES. It begins with the root, in which all objects are included in a single cluster. At each step of iteration, the most heterogeneous cluster is divided into two. The process is iterated until all objects are in their own cluster.

Divisive hierarchical clustering is good at identifying large clusters.

# The Objective

Measure the (dis)similarity of observations using distance measures (i.e. Euclidean distance, Manhattan distance, etc.)
In R, the Euclidean distance is used by default to measure the dissimilarity between each pair of observations. 


## How do we measure the dissimilarity between two clusters of observations? 
There are different cluster agglomeration methods (i.e, linkage methods) developed to answer to this question.

The most common types methods are:

Maximum or complete linkage clustering: It computes all pairwise dissimilarities between the elements in cluster 1 and the elements in cluster 2, and considers the largest value (i.e., maximum value) of these dissimilarities as the distance between the two clusters. It tends to produce more compact clusters.

Minimum or single linkage clustering: It computes all pairwise dissimilarities between the elements in cluster 1 and the elements in cluster 2, and considers the smallest of these dissimilarities as a linkage criterion. It tends to produce long, “loose” clusters.

Mean or average linkage clustering: It computes all pairwise dissimilarities between the elements in cluster 1 and the elements in cluster 2, and considers the average of these dissimilarities as the distance between the two clusters.

Centroid linkage clustering: It computes the dissimilarity between the centroid for cluster 1 (a mean vector of length p variables) and the centroid for cluster 2.
Ward’s minimum variance method: It minimizes the total within-cluster variance. At each step the pair of clusters with minimum between-cluster distance are merged.

## Data Preparation
Below are the main recommendations for using Hierarchical Clustering analysis:
1. Rows are observations (individuals) and columns are variables
2. Any missing value in the data must be removed or estimated.
3. The data must be standardized (i.e., scaled) to make variables comparable.

# Determining Optimal Clusters

## Elbow Method
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

# Now you are ready to read the code
