function imgScatter(Y, I, mask, imgW, imgH)
% IMGSCATTER - Scatter plot with images
%   
% SYNTAX
%
%   IMGSCATTER( YDATA, IMG )
%   IMGSCATTER( YDATA, IMG, MASK )
%   IMGSCATTER( YDATA, IMG, MASK, IMGW, IMGH )
%
% INPUT
%
%   YDATA       2-D points for scatter plot             [n-by-2]
%   IMG         Images for each point                   [p-by-r-by-n]
%               If it's a color image, it should have size [p-by-r-by-c-by-n]
%               c is the color channel. And the IMG 
%               shoud be in uint8 format instead of double
% 
% OPTIONAL
% 
%   MASK        Mask to plot subset of image            [n-by-1]
%               {default: ones(n,1)}
%   IMGW        Width of each image                     [scalar]
%               {default: 0.05}
%   IMGH        Height of each image                    [scalar]
%               {default: 0.05}
%
% DESCRIPTION
%
%   IMGSCATTER( YDATA, IMG ) plots the 2D points given in matrix
%   YDATA with the corresponding images in matrix IMG.
%
% See also      scatter
%
  
  if ~exist('mask', 'var') || isempty(mask)
    mask = ones(length(Y), 1);
  end
  
  if ~exist('imgW', 'var') || isempty(imgW)
    imgW = 0.05;
  end
  
  if ~exist('imgH', 'var') || isempty(imgH)
    imgH = 0.05;
  end
  
  n = size(Y, 1);
  
  figure
  scatter(Y(:, 1), Y(:, 2), '.');
  axis equal tight
  
  hold on
  
  for i = 1:n
    
    if mask(i) == 1
      if length(size(I))==3
         im = I(:,:,i);
         im = im';
         colormap gray;
      elseif length(size(I))==4
         im = I(:,:,:,i);
         im = permute(im, [2,1,3]);
      end
      ys=linspace(Y(i, 2) - imgW/2, Y(i, 2) + imgW/2, size(im, 1) );
      xs=linspace(Y(i, 1) - imgH/2, Y(i, 1) + imgH/2, size(im, 2) );
      
      
      imagesc(xs,ys,imrotate(im,90))
    end
      
  end % for i = 1:n
  
  
end

%   Binxu Wang                           binxu.wang@wustl.edu
% 
% CHANGELOG  (Jun 6, 2019) - Binxu
%   Add support for color image
%%------------------------------------------------------------
%
% AUTHORS
%
%   Kostas Mylonakis                        mylonakk@auth.gr
%   Dimitris Floros                         fcdimitr@auth.gr
%
% VERSION
%
%   1.0 - May 25, 2017
%
% CHANGELOG
%
%   1.0 (May 25, 2017) - Dimitris
%       * added mask to show subset of images
%       * fixed minor bug (image rotation)
%   0.1 (May 24, 2017) - Dimitris
%       * initial implementation
%
% ------------------------------------------------------------

