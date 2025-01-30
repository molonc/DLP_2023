function updateFrame(obj,event,himage)
     [rows, cols, ~] = size(event.Data);
     row_step = floor(rows / 2);
     col_step = floor(cols / 3);
     event.Data(row_step - 3:row_step + 3,:,:) = 255;
     event.Data(:, col_step-3:col_step+3, :) = 255;
     event.Data(:, 2*col_step - 3:2*col_step + 3, :) = 255;
     himage.CData = event.Data;
end