insert_file=eko2019_wpnew_postmeta_insert.dump
echo $insert_file

let line_number=1

for i in {0..8}
do
  echo ""
  file=eko2019_wpnew_postmeta_${i}
  file_name=${file}.dump
  rm $file_name
  echo "make ${file_name}"
  touch $file_name
  echo "LOCK TABLES wpnew_postmeta WRITE;" > $file_name
  for j in {1..11}
  do
     sed -n ${line_number}p ${insert_file} >> $file_name
     let line_number=$line_number+1 
  done
  echo "UNLOCK TABLES;" >> $file_name

done
    
