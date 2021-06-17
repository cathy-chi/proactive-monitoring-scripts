rm -rf zipped_scripts;
mkdir zipped_scripts;
FILES=`find testing_scripts -name '*.js'`;
for file in $FILES
do
    mkdir -p testing_scripts/nodejs/node_modules/;
    cp $file testing_scripts/nodejs/node_modules/;
    BASENAME=`basename $file .js`
    zip -r $BASENAME.zip testing_scripts/nodejs/*;
    rm -r testing_scripts/nodejs;
    mv $BASENAME.zip zipped_scripts/
done
