
close all
clc
clear all

% For reproducibility
load('rngDemo3.mat');
rng(s5);

FS=14;
N=3000;
cmap = jet(N);

% Data generation
theta= rand (N,1)*2*pi;
fai= rand(N,1)*2*pi;
X =[sin(theta).*cos(fai),sin(theta).*sin(fai),cos(theta)];
[x,I]=sort(X(:,1));
y=X(I,2);
z=X(I,3);
data=[x y z];

figure
scatter3(data(:,1),data(:,2),data(:,3),20,cmap)



reduced_dim=2;neighbor_num=12;

% LLE
[lle_Out] = lle(data',neighbor_num,reduced_dim);
lle_Out=lle_Out';
figure
scatter(lle_Out(:,1),lle_Out(:,2),20,cmap);set(gca,'FontSize',FS)
xlabel('LLE1')
ylabel('LLE2')
set(gca,'xtick',[])
set(gca,'ytick',[])

% Isomap
[iso_Out,~]=isomap(data,reduced_dim,neighbor_num);
iso_Out=iso_Out';

figure
scatter(iso_Out(1,:),iso_Out(2,:),20,cmap)
set(gca,'FontSize',FS)
xlabel('Iso1')
ylabel('Iso2')
set(gca,'xtick',[])
set(gca,'ytick',[])

% GSE
ref_Point=[1]; % Reference point for mapping
gse_Out=gse_nldr(data,reduced_dim,neighbor_num,ref_Point);


figure
scatter(gse_Out(:,1),gse_Out(:,2),20,cmap);set(gca,'FontSize',FS)
xlabel('GSE1')
ylabel('GSE2')
set(gca,'xtick',[])
set(gca,'ytick',[])
