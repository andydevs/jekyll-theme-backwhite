---
layout:   post
title:    Fractal Generator Now Has XML Processing
date:     2016-10-31
keywords: fractal c xml
excerpt_separator: <!--more-->
---

You can now run the fractal generator with an xml file containing all of the information of the fractals being generated to the program, rather than put the info in manually! Just type `fractal -xml [your xml file]` in the command line!

<!--more-->

## The XML File

Each fractal image being generated is represented by a `fractal` tag. Fractal files can have multiple `fractal` tags.

```xml
<fractal save="fractal.jpg">
	<complex real="-0.4" imag="-0.6"/>
	<size width="1920" height="1080"/>
	<transform angle="30" zoom="2">
		<offset real="-0.4" imag="-0.3"/>
	</transform>
	<colormap type="gradient">
		<start>0x00AA00</start>
		<end>0xFF00FF</end>
	</colormap>
</fractal>
```

Fractal objects must have a `save` attribute defined, which determines the location that the file is to be saved to. They can also have an `mbrot` attribute, a boolean that is true if the image being generated is the mandelbrot set, but defaults to false.

The complex tag is optional and defaults to 0 + 0i (it is also ignored if the mbrot attribute is set to true). The real component of the complex is set by the real attribute, while the imaginary component is set by the imag attribute. These do not have to be both defined, i.e. `<complex real="-0.4"/>` is also valid.

The size tag is required and must define `height` and `width` attributes, which correspond to the height and width of the image to be generated.

The transform component defines the transformation of the image (the zoom, offset, and angle). The angle represented by the attribute `angle` (defaults to 0), and the zoom is represented by the attribute `zoom` (defaults to 1). The offset is defined by a child tag in the transform named `offset`. It is identical to the complex tag, in that it has `real` and `imag` attributes which define the real and imaginary components of the offset complex.

Finally there is the colormap tag, which defines the colormap to use when generating the image. This can be defined in one of three ways. First off, the `type` attribute defines the type of colormap. There are two types: gradient and rainbow, each have their own children tags to define.

The gradient type linearly interpolates between two given color values. The gradient requires that a `start` and `end` tag be defined, which color values as integers. These are the start and end color values respectfully.

```xml
<colormap type="gradient">
	<start>0x00AA00</start>
	<end>0xFF00FF</end>
</colormap>
```

The rainbow type computes three sinusoidal functions for the red green and blue values of the color, each with it's own phase and frequency. The rainbow type requires `phase` and `freq` components, both of which require `r`, `g`, and `b` attributes which define the red, green, and blue values of both paramters respectfully. These values have defaults, for `phase`, these are all 0, and for `freq`, these are all 1.

```xml
<colormap type="rainbow">
	<phase r="0.2" g="1.5" b="5.4"/>
	<freq r="2" g="1" b="4"/>
</colormap>
```

Finally, you can set a preset colormap instead using the `preset` attribute. The value of the attribute is the name of the preset, and this attribute supercedes all other options, i.e. if the preset is set, the colormap will be set to the preset, and not be defined by any other parameters set.

```xml
<colormap preset="noir"/>
```

Again, a list of available preset names can be viewed by typing `fractal -cmaps`.

## End Note

I was putting this off for quite a while. I didn't really do anything with XML parsing before this, so I thought it would be quite a challenge. That is until I started on it. I was able to find an open C++ library (called pugixml) which allowed me to easily read xml documents and traverse xml tree structures (just like html in javascript, in fact). I could even iterate through xml tags with the same name and set default values for tags/attributes that wouldn't be defined. In short, I implemented the feature within a single weekend, so it wasn't as hard as I thought it would be. Things seem daunting until you try them.

Now, onto GPU acceleration...
