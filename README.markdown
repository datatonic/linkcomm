About
-----

Here is the code for finding link communities [1] in complex networks. There are two implementations here
(as provided by the authors of [1]): Python and C++. 

In addition, I have included an example notebook that uses the 'linkcomm' package on R [2]. 
The R implementation allows use of the Tanimoto coefficient instead of Jaccard's index, 
allowing generalisation to weighted, directed and signed links [1][2].

* Python: This implements the complete algorithm. It calculates
  similarities, constructs the dendrogram, and extracts the optimal
  communities. It is suitable for many occasions, is easy to use, and gives
  the exact solution. It may be too slow for very large networks, however,
  in which case you may want to use the C++ version.

* C++: to save computing time and memory usage, it calculates
  similarities but does not construct the dendrogram. You must manually 
  specify the similarity threshold used to obtain the communities.

References
----------

1. Yong-Yeol Ahn, James P. Bagrow, and Sune Lehmann, Link communities reveal multiscale 
   complexity in networks, _Nature_ **466**, 761 (2010).
   
2. Alex T. Kalinka, Pavel Tomancak, linkcomm: an R package for the generation visualisation, and 
   analysis of link communities in networks of arbitrary size and type, _Bioinformatics_ **27**, 2011 (2011).
