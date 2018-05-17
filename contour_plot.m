 load('all_combine_QP_mort.mat')
 figure(1),
%  [c,h]=contour(squeeze(squeeze(DIP(:,3,:,3))),squeeze(squeeze(DIN(:,3,:,3))),...
%      squeeze(squeeze(rate_QN(:,3,:,3)))./squeeze(squeeze(rate_QP(:,3,:,3))));
 [c,h]=contour(squeeze(squeeze(rate_QN(:,3,:,3)))./squeeze(squeeze(rate_QP(:,3,:,3))));
 clabel(c,h)
  xlabel('DIN')
 ylabel('DIP')
 title('Cellular N/P(DIN,DIP)')
  figure(2),
 % [c,h]=contour(squeeze(squeeze(DOP(:,:,3,3))),squeeze(squeeze(DIP(:,:,3,3))),...
  %    squeeze(squeeze(rate_fDOP(:,:,3,3))));
 [c,h]=contour(squeeze(squeeze(rate_QP(:,:,3,3))));
 clabel(c,h)
  xlabel('DOP')
 ylabel('DIP')
 title('Cellular P(DOP,DIP)')
 
 
  figure(3),
 % [c,h]=contour(squeeze(squeeze(DOP(:,:,3,3))),squeeze(squeeze(DIP(:,:,3,3))),...
  %    squeeze(squeeze(rate_fDOP(:,:,3,3))));
 [c,h]=contour(squeeze(squeeze(rate_QN(:,3,:,3))));
 clabel(c,h)
  xlabel('DIN')
 ylabel('DIP')
 title('Cellular N(DIN,DIP)')
 
  figure(4),
 % [c,h]=contour(squeeze(squeeze(DOP(:,:,3,3))),squeeze(squeeze(DIP(:,:,3,3))),...
  %    squeeze(squeeze(rate_fDOP(:,:,3,3))));
 [c,h]=contour(squeeze(squeeze(rate_fDOP(3,:,3,:))));
 clabel(c,h)
  xlabel('k')
 ylabel('DOP')
 title('fDOP(K,DOP)')
 
 
   figure(5),
 % [c,h]=contour(squeeze(squeeze(DOP(:,:,3,3))),squeeze(squeeze(DIP(:,:,3,3))),...
  %    squeeze(squeeze(rate_fDOP(:,:,3,3))));
 [c,h]=contour(squeeze(squeeze(rate_fDOP(:,:,3,3))));
 clabel(c,h)
  xlabel('DOP')
 ylabel('DIP')
 title('fDOP(DOP,DIP)')