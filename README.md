# Unsupervised Learning Algorithms
This is a Unsupervised Tutorial Training of Hierarchical Clustering using application of with Wine Reviews

Source of the Data:
We will use as Data set a review of the Wines with different variarities across different regions and providence.
https://www.kaggle.com/zynicide/wine-reviews
Due to the large number set, we will extract a subset to increase computing power

Hierarchical clustering can be divided into two main types: agglomerative and divisive.

Agglomerative clustering: It’s also known as AGNES (Agglomerative Nesting). It works in a bottom-up manner. That is, each object is initially considered as a single-element cluster (leaf). At each step of the algorithm, the two clusters that are the most similar are combined into a new bigger cluster (nodes). This procedure is iterated until all points are member of just one single big cluster (root) (see figure below). The result is a tree which can be plotted as a dendrogram.
Divisive hierarchical clustering: It’s also known as DIANA (Divise Analysis) and it works in a top-down manner. The algorithm is an inverse order of AGNES. It begins with the root, in which all objects are included in a single cluster. At each step of iteration, the most heterogeneous cluster is divided into two. The process is iterated until all objects are in their own cluster (see figure below).
