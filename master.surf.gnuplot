set table "master.surf.table"; set format "%.5f"
set format "%.7e";;set pm3d map interpolate 0,0; splot 'data/fullfields/T_mean.csv' matrix using 1:2:($3);
