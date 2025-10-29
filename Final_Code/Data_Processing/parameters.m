function [maxcalc,mincalc,meancalc,rmscalc,maxgradcalc,stdcalc,zeroc] = parameters(win)

maxcalc = max(win);
mincalc = min(win);
meancalc = mean(win);
rmscalc = rms(win);
maxgradcalc = max(abs(gradient(win)));
stdcalc = std(win);
sign_changes = diff(sign(win)) ~= 0;
zeroc = sum(sign_changes);

end