clear
tic
N=64;
M=zeros(N);
ESN=10;
%format shortG
%p=0.1:0.01:0.55;
%p(47:66)=0.555:0.005:0.65;
%p(67:101)=0.66:0.01:1;
%p=0.55:0.001:0.65;
p=0.1:0.001:1;
P=zeros(ESN,length(p));
Pinfgiant=zeros(ESN,length(p));
meanSgiant=zeros(ESN,length(p));
meanSspan=zeros(ESN,length(p));
Pinfspan=zeros(ESN,length(p));
ha=0;
for q=1:ESN
    ha=ha+1
    for i=1:length(p)
        A=zeros(N);
        for j=1:N^2
            if rand <= p(i)
               A(j)=1;
            end
        end
        C=zeros(N);
        C=bwlabel(A,4);
        clusternum=max(max(C));
        P(q,i)=sum(sum(A))/(N^2);
        clustersize=zeros(1,clusternum);
        for k=1:clusternum
            row=zeros();
            col=zeros();
            [row,col]=find(k==C);
            clustersize(1,k)=length(row);
        end
       
        giantcluster=zeros();
        giantnum=find(max(clustersize)==clustersize,1); %span
        r=zeros();
        c=zeros();
        [r,c]=find(giantnum==C);
        MINUSR=zeros();
        MINUSR=max(r)-min(r);
        MINUSC=zeros();
        MINUSC=max(c)-min(c);
        if (MINUSR== N-1) || (MINUSC== N-1)
            giantcluster=max(clustersize);
        end
        
        %
%         giantcluster1=zeros();  %giant
%         giantcluster1=max(clustersize);
        %
        Pinfspan(q,i)=giantcluster/(N^2); %span percolation
%         Pinfgiant(q,i)=giantcluster1/(N^2); %giant
        domin=sum(clustersize.^2);
        meanSspan(q,i)=((domin-(giantcluster^2))/((sum(clustersize))-giantcluster)); %span
%         meanSgiant(q,i)=((domin-(giantcluster1^2))/((sum(clustersize))-giantcluster1)); %giant
    end
end
PMinfspan=mean(Pinfspan,1);
MCSspan=mean(meanSspan,1);
% PMinfgiant=mean(Pinfgiant,1);
% MCSgiant=mean(meanSgiant,1);
PM=mean(P,1);

toc
figure
plot(PM,PMinfspan,'o');title('span');
figure
plot(PM,MCSspan,'o');title('span');
% figure
% plot(PM,PMinfgiant,'^');title('giant');
% figure
% plot(PM,MCSgiant,'^');title('giant');

% save(['P' num2str(N) '.mat'],'PM');
% save(['MCS' num2str(N) '_span.mat'],'MCSspan');
% save(['MCS' num2str(N) '_giant.mat'],'MCSgiant');
% save(['Pinf' num2str(N) '_span.mat'],'PMinfspan');
% save(['Pinf' num2str(N) '_giant.mat'],'PMinfgiant');
