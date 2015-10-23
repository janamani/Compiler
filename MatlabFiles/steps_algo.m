close all;
clear all;

bits = 8;
number = 2^bits;

%% Algorithm 1
steps_algo1 = zeros(number,number);

for i=1:1:number
    for j=1:1:number
        input = i-1;
        output = j-1;
        
        input_digital = fliplr(dec2binvec(input,bits));
        output_digital = fliplr(dec2binvec(output,bits));
        
        if output>input
            count_lead_ones = 0;
            for k=1:1:bits
                if input_digital(k)==0
                    break;
                end
                if input_digital(k)==1
                    count_lead_ones = count_lead_ones+1;
                end
            end
            steps_algo1(i,j) = bits-count_lead_ones;
        end
        if output<input
            count_lead_zeros = 0;
            for k=1:1:bits
                if input_digital(k)==1
                    break;
                end
                if input_digital(k)==0
                    count_lead_zeros = count_lead_zeros+1;
                end
            end
            steps_algo1(i,j) = bits-count_lead_zeros;
        end
    end
end
%imshow(steps_algo1/max(max(steps_algo1))*255,[])
figure;
[r,c] = size(steps_algo1);                           %# Get the matrix size
imagesc((1:c)+0.5,(1:r)+0.5,steps_algo1);            %# Plot the image
colorbar
axis equal                                   %# Make axes grid sizes equal
set(gca,'XTick',1:bits:(c+1),'YTick',1:bits:(r+1),...  %# Change some axes properties
        'XLim',[1 c+1],'YLim',[1 r+1],...
        'GridLineStyle','-','XGrid','on','YGrid','on');


%% Algorithm 2
steps_algo2 = zeros(number,number);

for i=1:1:number
    for j=1:1:number
        input = i-1;
        output = j-1;
        
        input_digital = fliplr(dec2binvec(input,bits));
        output_digital = fliplr(dec2binvec(output,bits));

        if output>input
            pointer_first_tail_zeros = 0;
            for k=bits:-1:1
                if input_digital(k)==1
                    continue;
                end
                if input_digital(k)==0
                    pointer_first_tail_zeros = k;
                    
                        input_digital(pointer_first_tail_zeros) = 1;
                        input_value = bin2dec(num2str(input_digital));
                        steps_algo2(i,j) = steps_algo2(i,j)+1;
                        if input_value < output
                            continue;
                        end
                        if input_value > output
                            steps_algo2(i,j) = steps_algo2(i,j)+bits-pointer_first_tail_zeros+1;
                            break;
                        end                 
                    
                end                  
            end
            
        end
        
         if output<input
            pointer_first_tail_one = 0;
            for k=bits:-1:1
                if input_digital(k)==0
                    continue;
                end
                if input_digital(k)==1
                    pointer_first_tail_one = k;
                    
                        input_digital(pointer_first_tail_one) = 0;
                        input_value = bin2dec(num2str(input_digital));
                        steps_algo2(i,j) = steps_algo2(i,j)+1;
                        if input_value > output
                            continue;
                        end
                        if input_value < output
                            steps_algo2(i,j) = steps_algo2(i,j)+bits-pointer_first_tail_one+1;
                            break;
                        end                  
                    
                end                  
            end
            
         end
        
        
    end
end
%imshow(steps_algo2/max(max(steps_algo2))*255,[])
figure;
[r,c] = size(steps_algo2);                           %# Get the matrix size
imagesc((1:c)+0.5,(1:r)+0.5,steps_algo2);            %# Plot the image
colorbar
axis equal                                   %# Make axes grid sizes equal
set(gca,'XTick',1:bits:(c+1),'YTick',1:bits:(r+1),...  %# Change some axes properties
        'XLim',[1 c+1],'YLim',[1 r+1],...
        'GridLineStyle','-','XGrid','on','YGrid','on');
