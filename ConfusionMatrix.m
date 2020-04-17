function CM = ConfusionMatrix(actualData,predictedData,class)
    predict = max(predictedData);
    actual = max(actualData);
    CM = zeros(class,class);
    sort(actualData);
    sort(predictedData);
    for i = 1:max(predictedData)
        for j = 1:size(actualData,1)
            if actualData(j) == i
                if actualData(j) == predictedData(j)
                    CM(i,i) = CM(i,i) + 1;
                else
                    CM(i,predictedData(j)) = CM(i,predictedData(j)) + 1;
                end
            end
        end
    end
end

