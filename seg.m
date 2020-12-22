%Segmentation using k maps
x=imread('brain5.jpg');
x1=double(rgb2gray(x));
 H = fspecial('average',5);
 x1= imfilter(x1,H,'replicate'); 
% x1= medfilt2(x1);
x11=x1(:);%Conversion to matrix
copy=x1;
[R,C,Z,K]=size(x1);
%Centroid matrix
mu=[50 110 180 210];
%Centrois zeros for each cluster
a1=zeros(R,C);
a2=zeros(R,C);
a3=zeros(R,C);
a4=zeros(R,C);
%a5=zeros(R,C);
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
            if mn(1)==4;
                a4(i,j)=x1(i,j);
            end
            %if mn(1)==5;
                %a5(i,j)=x1(i,j);
            %end
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
            
            col4=a4(:);
            s4=sum(col4);
            f4=find(col4);%$to find non zero elwment
            len4=length(f4);
            mm4=s4/len4;
            mm44=round(mm4);%new center element
            
            %col5=a5(:);
            %s5=sum(col5);
            %f5=find(col5);%$to find non zero elwment
            %len5=length(f5);
            %mm5=s5/len5;
            %mm55=round(mm5);%new center element
            
            
            %new centroid
            mu=[mm11 mm22 mm33 mm44];
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
                if a4(i,j)>0
                    a4(i,j)=4;
                end
                %if a5(i,j)>0
                 %   a5(i,j)=5;
                %end
            end
            end
            %clustered image
            clusterfinal=[a1+a2+a3+a4];

             
             figure;imshow(x)
             title('Original Image');
             
             figure;imshow(clusterfinal,[])
             title('Clustered Image');
                
            
                
    
