rm -rf zipped_scripts;
mkdir zipped_scripts;
FILES=`find testing_scripts -name '*.js'`;
for file in $FILES
do
    mkdir -p testing_scripts/nodejs/node_modules/;
    cp $file testing_scripts/nodejs/node_modules/;
    BASENAME=`basename $file .js`
    cd testing_scripts
    zip -r $BASENAME.zip nodejs/*;
    cd ..
    mv testing_scripts/$BASENAME.zip zipped_scripts/
    rm -r testing_scripts/nodejs;
done
