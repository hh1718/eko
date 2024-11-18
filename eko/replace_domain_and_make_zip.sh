replace_after=sample.domain
replace_before=eko.co.jp
echo ""
echo "replace ${replace_before} to ${replace_after}"
echo ""

base_file=eko2019_light.dump
file=eko2019_light_replace_domain
file_name="${file}.dump"
echo "start to replace $file_name}"
replace_cnt=$(grep -io "${replace_before}" ./${file_name} | wc -l)
echo "replace target count of file_name is ${replace_cnt}"
rm $file_name
cp $base_file $file_name
sed -i '' s/${replace_before}/${replace_after}/g ./${file_name}
echo "make zip"
zip ${file}.zip $file_name

for i in {0..8}
do
  echo ""
  file=eko2019_wpnew_postmeta_${i}
  file_name=${file}.dump
  echo "start to replace ${file_name}"
  replace_cnt=$(grep -io "${replace_before}" ./${file_name} | wc -l)
  echo "replace target count of ${file_name} is ${replace_cnt}"
  sed -i '' s/${replace_before}/${replace_after}/g ./${file_name}
  echo "make zip"
  zip ${file}.zip $file_name
done
