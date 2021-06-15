rm -rf zipped_scripts;
mkdir zipped_scripts;
find testing_scripts -name '*.js' -execdir zip '{}.zip' '{}' \;;
find testing_scripts -type f -name '*.zip' -exec mv {} zipped_scripts/ \;
