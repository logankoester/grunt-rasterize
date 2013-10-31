# grunt-rasterize

[![Build Status](https://travis-ci.org/logankoester/grunt-rasterize.png?branch=master)](https://travis-ci.org/logankoester/grunt-rasterize)

> Rasterize SVG graphics at various sizes using [Inkscape](http://inkscape.org/)

## Getting Started
This plugin requires Grunt `~0.4.1`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-rasterize --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-rasterize');
```
### Inkscape

Make sure the `inkscape` binary is in your PATH.

## The "rasterize" task

### Overview
In your project's Gruntfile, add a section named `rasterize` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  rasterize: {
    your_target: {
      vector: 'example.svg',
      raster: [
        { path: 'example-small.png', width: 64 },
        { path: 'example-large.png', width: 128 }
      ]
    },
  },
})
```

## Release History

#### 0.1.1

* Fixes early termination (async bug)

#### 0.1.0

* Initial release


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/logankoester/grunt-rasterize/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

