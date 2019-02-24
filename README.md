# Unsupervised Learning Algorithms
This is a Unsupervised Tutorial Training of Hierarchical Clustering using application of with Wine Reviews

## Source of the Data:
We will use as Data set a review of the Wines with different variarities across different regions and providence.
https://www.kaggle.com/zynicide/wine-reviews
Due to the large number set, we will extract a subset to increase computing power

Hierarchical clustering can be divided into two main types: agglomerative and divisive.

## Agglomerative clustering:
It’s also known as AGNES (Agglomerative Nesting). It works in a bottom-up manner. That is, each object is initially considered as a single-element cluster (leaf). At each step of the algorithm, the two clusters that are the most similar are combined into a new bigger cluster (nodes). This procedure is iterated until all points are member of just one single big cluster (root) (see figure below). The result is a tree which can be plotted as a dendrogram.

Agglomerative clustering is good at identifying small clusters.

## Divisive hierarchical clustering:
It’s also known as DIANA (Divise Analysis) and it works in a top-down manner. The algorithm is an inverse order of AGNES. It begins with the root, in which all objects are included in a single cluster. At each step of iteration, the most heterogeneous cluster is divided into two. The process is iterated until all objects are in their own cluster.

Divisive hierarchical clustering is good at identifying large clusters.

## The Objective

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
