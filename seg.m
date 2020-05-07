%Segmentation using k maps
x=imread('glioblastoma.jpg');
x1=double(rgb2gray(x));
 H = fspecial('average',3);
 x1= imfilter(x1,H,'replicate'); 
% x1= medfilt2(x1);
x11=x1(:);%Coversion to matrix
copy=x1;
[R,C,Z]=size(x1);
%Centroid matrix
mu=[55 160 215];
%Centrois zeros for each cluster
a1=zeros(R,C);
a2=zeros(R,C);
a3=zeros(R,C);
while(true)
    oldmu=mu;
    for i=1:R
        for j=1:C
            ab=abs((x1(i,j))-mu);
            mn=find(ab==min(ab));
            if mn(1)==1
                a1(i,j)=x1(i,j);
            end
            if mn(1)==2;
                a2(i,j)=x1(i,j);
            end
            if mn(1)==3;
                a3(i,j)=x1(i,j);
            end
        end
    end
            col1=a1(:);
            s1=sum(col1);
            f1=find(col1);%$to find non zero elwment
            len1=length(f1);
            mm1=s1/len1;
            mm11=round(mm1);%new center element
            
            col2=a2(:);
            s2=sum(col2);
            f2=find(col2);%$to find non zero elwment
            len2=length(f2);
            mm2=s2/len2;
            mm22=round(mm2);%new center element
            
            col3=a3(:);
            s3=sum(col3);
            f3=find(col3);%$to find non zero elwment
            len3=length(f3);
            mm3=s3/len3;
            mm33=round(mm3);%new center element
            %new centroid
            mu=[mm11 mm22 mm33];
            if (mu==oldmu)
                break
            end
end




%             labelling of cluster
             for i=1:R
             for j=1:C
                if a1(i,j)>0
                    a1(i,j)=1;
                end
                if a2(i,j)>0
                    a2(i,j)=2;
                end
                if a3(i,j)>0
                    a3(i,j)=3;
                end
            end
            end
            %clustered image
            clusterfinal=[a1+a2+a3];

             
             figure;imshow(x)
             title('Original Image');
             
             figure;imshow(clusterfinal,[])
             title('Clustered Image');
%             
                
            
                
    
