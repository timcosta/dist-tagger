# Dist Tagger

## Why?
Oftentimes you do not want to include your `dist` directory in your main repository, but when creating tags for distribution you obviously want to include the `dist` directory.

This script will run `build.sh` if that file exists, and if it does not it will attempt to run `grunt` to generate the dist directory. 

## Usage
The `release.sh` script takes two arguments - the branch you would like to use as the base for your release and the version you would like to tag your release as. 

After your `release_x.x.x` branch is finalized, you can run `./release.sh release_x.x.x y.y.y` to create a new release on Github from the `release_x.x.x` branch that is tagged as `y.y.y`. 

