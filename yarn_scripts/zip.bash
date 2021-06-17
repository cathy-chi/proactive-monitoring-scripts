rm -rf zipped_scripts;
mkdir zipped_scripts;
FILES=`find testing_scripts -name '*.js'`;
for file in $FILES
do
    mkdir -p testing_scripts/nodejs/node_modules/;
    cp $file testing_scripts/nodejs/node_modules/;
    zip -r $file.zip testing_scripts/nodejs/*;
    rm -r testing_scripts/nodejs;
    mv $file.zip zipped_scripts/
done
