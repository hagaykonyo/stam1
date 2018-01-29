function [x_ind, y_ind, vals] = allstars(Mat, freksstrips, nDelta, thresh)

stars = []; 

for delta_t = 1:nDelta:size(Mat,2)-nDelta
    for k = 1:size(freksstrips,1)
        stars_ft = stars2(Mat(freksstrips(k,1):freksstrips(k,2),delta_t:delta_t+nDelta-1), thresh);
        stars_ft(:,2) = stars_ft(:,2) + freksstrips(k,1) - 1;
        stars_ft(:,1) = stars_ft(:,1) + delta_t - 1;
        stars = cat(1,stars,stars_ft);
    end
end

x_ind = stars(:,1);
y_ind = stars(:,2);
vals = stars(:,3);

end