%% Kernel for mean cluster size_ finite size analysis_random percolation
% load('MCS512_span.mat');
% load('P512.mat');
% load('MCS512_giant.mat');
% load('P512.mat');
P1=zeros(); MCS=zeros();   

P1=PM;
MCS=MCSspan;

%

%P1=PM;
%MCS=MCSgiant; 

sigma=0.01;
three_sigma=3*sigma;
DX=0.001;
Bin=0.1:DX:1;
KERNEL=zeros(1,length(Bin));
 P1(isnan(MCS))=[];
 MCS(isnan(MCS))=[];
for B=1:length(Bin)
    MIN=max(0, Bin(B)-three_sigma);
    MAX=min(1, Bin(B)+three_sigma); 
    IND1=find(P1 >= MIN & P1 < MAX);
    numerator=0; denominator=0;
    for B1=1:length(IND1)
        numerator=numerator+MCS(IND1(B1))*(exp(-(((Bin(B)-P1(IND1(B1)))^2)/(2*(sigma^2)))));
        denominator=denominator+exp(-(((Bin(B)-P1(IND1(B1)))^2)/(2*(sigma^2))));
        KERNEL(1,B)=numerator/denominator;
        
    end
end
figure
plot(Bin,KERNEL,'o')
grid on
%save('KERNELMCS64_span.mat','KERNEL')
%% Kernel for Pinf_finite size_random percolation
%clear
P1=zeros(); 
Pinf=zeros();

% load('Pinf512_span.mat');
% load('P512.mat');
P1=PM;   
Pinf=PMinfspan;

% load('Pinf512_giant.mat');
% load('P512.mat');
% P1=PM;   
% Pinf=PMinfgiant;

P1(isnan(Pinf))=[];
Pinf(isnan(Pinf))=[];


sigma=0.01;
three_sigma=3*sigma;
DX=0.001;
Bin=0.1:DX:1;
KERNEL=zeros(1,length(Bin));
 
for B=1:length(Bin)
    %IND1=find(SEQ >= Bin(B)-three_sigma & SEQ <= Bin(B)+three_sigma);
    MIN=max(0, Bin(B)-three_sigma);
    MAX=min(1, Bin(B)+three_sigma); 
    IND1=find(P1 >= MIN & P1 < MAX);
    numerator=0; denominator=0;
    for B1=1:length(IND1)
        numerator=numerator+Pinf(IND1(B1))*(exp(-(((Bin(B)-P1(IND1(B1)))^2)/(2*(sigma^2)))));
        denominator=denominator+exp(-(((Bin(B)-P1(IND1(B1)))^2)/(2*(sigma^2))));
        KERNEL(1,B)=numerator/denominator;
        
    end
end
figure
plot(Bin,KERNEL,'o')
grid on
%save('KERNELPinf64_giant.mat','KERNEL')

