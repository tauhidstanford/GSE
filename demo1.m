
warning off
close all
clear
load('face_data.mat'); % Statue face data

data=images';
FS=14;
HeightH=0.1;
WidthW=0.1;
reduced_Dim=32;neighbor_Num=15;

% For reproducibility
load('rngDemo1.mat');
rng(s2)

% LLE
[lle_Out] = lle(data',neighbor_Num,reduced_Dim);
lle_Out=lle_Out';

for kk=1:698
    dataRe1(:,:,kk)=reshape(data(kk,:),[64 64]);
end

lle_Outx=lle_Out(:,1:2);

Mask1=zeros(1000,1);
Nn=40;

for ii=1:Nn:1000
    Mask1(ii)=1;
end

lle_Outx=rescale(lle_Outx,-1,1);

imgScatter(lle_Outx, dataRe1, Mask1,HeightH,WidthW);
set(gca,'FontSize',FS)
xlabel('LLE1')
ylabel('LLE2')
set(gca,'xtick',[])
set(gca,'ytick',[])

% Isomap
[iso_Out,mp]=isomap(data,reduced_Dim,neighbor_Num);
iso_Outx=iso_Out(:,1:2);
iso_Outx=rescale(iso_Outx,-1,1);

imgScatter(iso_Outx, dataRe1, Mask1,HeightH,WidthW);
xlabel('Iso1')
ylabel('Iso2')
set(gca,'xtick',[])
set(gca,'ytick',[])

% GSE
gse_Out=gse_nldr(data,reduced_Dim,neighbor_Num);
gse_Outx=gse_Out(:,1:2);
gse_Outx=rescale(gse_Outx,-1,1);

imgScatter(gse_Outx, dataRe1, Mask1,HeightH,WidthW);
xlabel('GSE1')
ylabel('GSE2')
set(gca,'xtick',[])
set(gca,'ytick',[])





