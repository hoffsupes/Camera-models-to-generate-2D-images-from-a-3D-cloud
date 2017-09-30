# Camera-models-to-generate-2D-images-from-3D-points
Various camera models (Full, Weak and Orthographic) are used to convert 3D real world points into 2D image pixel coordinates by simulating a 'virtual camera'


A set of 3D points representing a human face are given. They are converted into 2D image pixel coordinates via the application of Weak, Full and Orthographic Perspective Image transforms. The action of a camera, that is conversion of the camera coordinates to image ones by lens action (Xc,Yc ----> u,v) and the frame grabber / A->D converter are simulated through the intristic camera matrix W = [f*sx 0 c0; 0 f*sy r0; 0 0 1]. The discrepency between the real world frame and the camera frame / coordinate system is represented via the extrinsic camera matrix M = [R T] which stores the rotation and translation information for the data.

The main file to run is the Main_RUNME.m file. 


BONUS:

To interpolate points in the orthographic projection, a method was devised to determine intensity values of points when only sparse points are present in an image. First, the points were coagulated to give a (relatively) less sparse representation, then at each point within the facial region, whenever there is a hole / gap / zero region, that is a region of pixels / pixel value which should have some value in the region, but instead does not would have it's subsequent nxn neighborhood looked in, and the k nearest (nearest in terms of distance to that point) non zero values found. Its value is set to the average of those k values. Why would this method be useful?

Average based intensity interpolation methods, although being simple, only rely on collecting as many values around the pixel as possible and averaging them all. In doing so, a lot of information is lost. Especially in cases where only sparse pixels coordinates and their values are present. The notion here being that: the nearest pixels to any zero pixel would present a higher possibility of giving more accurate values / capture the actual value of that pixel better. Hence making the search space on the pixel tighter (nxn neighborhood) would greatly increase the possibility that an accurate value for the pixel is found and force it to search within only it's nearest neighbors. Within that nxn space, all non zero pixels are looked at and only the k *nearest* neighbors are considered. These are points which are closest in terms of position to the pixel in consideration, thereby more likely to be a better represntative of the value of that pixel on averaging. Also, limiting the value to a certain k, means that not too many values (especially which are too far away) are considered. This prevents drastic changes in the values being considered thereby no single value ends up dominating the average too often. This makes it slighly better than simply averaging many nonzero points found with a large neighborhood of any zero pixel.

The way that the facial region is selected is by the means of a mask. This is done by a complex operation involving first creating a binary version of the edge image. Dilating it with a sphere of radius 30 pixels. From this, subtracting the region of the images which are non zero. Opening the result by a sphere structuring element of radius 4. Subtracting this result from the original dilation of binary edges. Doing a [5 5] median filtering on the result, followed by filling in of zero pixels in the non zero binary image area. Note this will only work on an image having a sparse representations of points. 

FOR DEMO ON THE n neighborhood point interpolation, that is, the intermediate results, can be found in the folder "ORTHO" in this repository. 

Projected 2D face images can be found within the Folder R.



