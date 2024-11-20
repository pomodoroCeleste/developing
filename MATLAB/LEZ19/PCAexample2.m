clear all
clc
load imports-85

[coeff,score,latent,tsquared,explained] = pca(X(:,3:15));
 
explained

scatter3(score(:,1),score(:,2),score(:,3))
axis equal
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
zlabel('3rd Principal Component')