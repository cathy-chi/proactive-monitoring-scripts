# Proactive Monitoring E2E Tests

### testing_scripts
This directory contains scripts that are Puppeteer tests modified as [AWS Synthetic canary scripts](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Synthetics_Canaries_WritingCanary_Nodejs.html#CloudWatch_Synthetics_Canaries_modify_puppeteer_script). 

### zipped_scripts
This directory contains the zipped copies of these scripts with the appropriate file structure. These canaries will be created via AWS Lambdas and therefore, when they run the canary scripts, they expect the files to have the appropriate [library dependency file structure](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-path). Running `yarn zip` after writing your canary script in Javascript will create those directories correctly.

### yarn_scripts
These scripts are `.bash` scripts to use for custom `yarn` commands created in the `package.json` file.

### .github/workflows
This directory contains the workflow scripts that are run after some `github`actions are performed (e.g. merged into `main`). `release.yml` pushes the scripts in `zipped_scripts` to S3 upon merging with `main`.
