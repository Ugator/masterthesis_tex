var_l=c('DT_CON','POT_VORTIC','QV','T_ENTR','THHR_RAD','TINC_LH','T','U','V','W')


load('heights.RData')
vars=paste(var_l,'_fts',sep='')

for (ii in seq_along(vars)){
   var_files=list.files(pattern=paste('^',vars[ii],'_2.*',sep=''))
   print(var_files)
   nfiles=length(var_files)
   load(var_files[1])
   mean_out=array(0,dim=c(length(prof_vert_fts),nfiles))
   for (jj in seq_along(var_files)){
      cat(var_files[jj],'\n')
      load(var_files[jj])
      mean_out[,jj]=prof_vert_fts
   }
   if (length(prof_vert_fts)==50) {height_vec=heights_fl}
   else {height_vec=heights_hl} 
   mean_out=apply(mean_out,1,mean,na.rm=TRUE)*(60*60*24)
   mean_out=data.frame(height_vec,mean_out)
   save(mean_out,file=paste(vars[ii],'_mean.RData',sep=''))
   write.table(mean_out,file=paste(vars[ii],'_mean.csv',sep=''),quote=FALSE
	       ,row.names=FALSE,col.names=FALSE,sep=';')
}

vars=paste(var_l,'_ats',sep='')

for (ii in seq_along(vars)){
   var_files=list.files(pattern=paste('^',vars[ii],'_2.*',sep=''))
   print(var_files)
   nfiles=length(var_files)
   load(var_files[1])
   mean_out=array(0,dim=c(length(prof_vert_ats),nfiles))
   for (jj in seq_along(var_files)){
       cat(var_files[jj],'\n')
       load(var_files[jj])
       mean_out[,jj]=prof_vert_ats
   }
   if (length(prof_vert_ats)==50) {height_vec=heights_fl}
   else {height_vec=heights_hl} 
   mean_out=apply(mean_out,1,mean,na.rm=TRUE)*(60*60*24)
   mean_out=data.frame(height_vec,mean_out)
   save(mean_out,file=paste(vars[ii],'_mean.RData',sep=''))
   write.table(mean_out,file=paste(vars[ii],'_mean.csv',sep=''),quote=FALSE
               ,row.names=FALSE,col.names=FALSE,sep=';')
}

