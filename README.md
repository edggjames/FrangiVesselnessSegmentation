# FrangiVesselnessSegmentation

The enhancement of line-like features (2D) and tubular features (3D) in medical   
images is a common low-level image processing task that is often performed prior  
to, or as part of image segmentation algorithms. This repository describes the  
code that I have written to implement a GUI to implement a Frangi Vesselness  
filter (see the paper [A. Frangi, et al., Multiscale vessel enhancement filtering.  
Proc. MICCAI 2008] that is inlcuded in this repository). This is part of a widely  
used class of methods for enhancing blood vessels based on the analysis of the  
second-order derivatives of an image.

The implementation of the algorithm has the following hierarchy:
  * vessleness_filter.m  
  performs Frangi vesselness filtering (i.e. constructs a 4D Hessian matrix   
  containing 4 second order Gaussian image derivatives, computes eigenvalues and  
  the segmented image pixel values)
      * gaussian_imfilter_sep.m  
      filters an image using a nth order derivative Gaussian kernel
          * comp_dgaussian.m  
          computes nth order derivative of a Gaussian kernel using the physicist's  
          Hermite polynomial
              * comp_gaussian.m  
              computes a 1D Gaussian kernel
              * comp_hermite_rec.m  
              computes the physicist's Hermite polynomial of order n using function  
              recursion.

The parameter sigma controls the scale of the vessels that are highlighted, and  
the parameter beta controls the sensitivity of the line filter to the blobness  
measure.

Error checking and exception handling (with regard to opening, closing, saving  
and compatible image formats) is factored into the GUI.

Example outputs for a sample image using a small selection of sigma and beta  
values is shown in Sample_Output.pdf.
