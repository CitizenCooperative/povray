// Generated By:Studio
// Date: 01/21/2024 07:48:04
// Input LDraw File: studio_root
//\n// This file was automatically generated from an LDraw file by the program\n// %s.  See comments above for further details.\n\n// This POV file requires the LGEO library to render properly.
// Please set the LGEO library path in your POV-Ray settings before rendering.

#version 3.7;

#declare LDXQual = 2;	// Quality (0 = Bounding Box; 1 = No Refraction; 2 = Normal; 3 = Stud Logos)
#declare LDXSW = 0.325000;	// Seam Width (0 for no seams)
#declare LDXStuds = 1;	// Show studs? (1 = YES; 0 = NO)
#declare LDXRefls = 1;	// Reflections? (1 = YES; 0 = NO)
#declare LDXShads = 1;	// Shadows? (1 = YES; 0 = NO)
#declare LDXFloor = 1;	// Include Floor? (1 = YES; 0 = NO)

// Model bounds information
#declare LDXMinX = -80;
#declare LDXMinY = -28;
#declare LDXMinZ = -40;
#declare LDXMaxX = 0;
#declare LDXMaxY = 8;
#declare LDXMaxZ = 40;
#declare LDXCenterX = -40;
#declare LDXCenterY = -10;
#declare LDXCenterZ = 0;
#declare LDXCenter = <LDXCenterX,LDXCenterY,LDXCenterZ>;
#declare LDXRadius = 118.726578;

// Camera settings
#declare LDXCameraLoc = < 0,-515.3741,-611.874 >;	// Camera Location vector
#declare LDXCameraLookAt = < 0,0,0 >;	// Camera look-at point vector
#declare LDXCameraSky = < 1.872535E-07,-0.7648424,0.6442176 >;	// Camera sky vector (<0,-1,0> will usually work for standard "up")

#declare LDXFloorLoc = LDXMaxY;	// Floor location. (Dependent on floor axis; MAX_Y is bottom of model)
#declare LDXFloorAxis = y;	// Floor axis (x, y, or z)
#declare LDXFloorR = 0.800000;	// Floor Red
#declare LDXFloorG = 0.800000;	// Floor Green
#declare LDXFloorB = 0.800000;	// Floor Blue
#declare LDXFloorAmb = 0;	// Floor Ambient
#declare LDXFloorDif = 0.800000;	// Floor Diffuse
#declare LDXAmb = 0;
#declare LDXDif = 1;
#declare LDXRefl = 0.025000;
#declare LDXPhong = 1;
#declare LDXPhongS = 40;
#declare LDXTRefl = 0.015000;
#declare LDXTFilt = 0.75;
#declare LDXTTransmit = 0.150000;
#declare LDXIoR = 1.25;
#declare LDXRubberRefl = 0;
#declare LDXRubberPhong = 0.100000;
#declare LDXRubberPhongS = 10;
#declare LDXChromeAmb = 0.25;
#declare LDXChromeDif = 0.600000;
#declare LDXChromeRefl = 0.5;
#declare LDXChromeBril = 5;
#declare LDXChromeSpec = 0.700000;
#declare LDXChromeRough = 0.010000;
#declare LDXIPov = 1;	// Use inline POV code from LDraw file? (1 = YES; 0 = NO)
#declare LDXBgR = 1;	// Background Red
#declare LDXBgG = 1;	// Background Green
#declare LDXBgB = 1;	// Background Blue
#declare LDXOrigVer = version;	// DO NOT MODIFY

#declare lg_quality = 2;

global_settings {
	assumed_gamma 1.4
	adc_bailout 0.01/2
	radiosity {
		brightness 0.5
	}
	max_trace_level 4
}

// Camera
#ifndef (LDXSkipCamera)
camera {
	perspective
	#declare LDXCamAspect = image_width/image_height;
	location LDXCameraLoc
	sky LDXCameraSky
	right LDXCamAspect * < -1,0,0 >
	look_at LDXCameraLookAt
	angle 19.912155
}
#end



#declare CameraTheta = 0;

// Lat, Lon: degree
// LightPower: 0~1 float
// Shadowless: 0=false, 1=true
#macro WriteLight(Lat, Lon, LightPower, Shadowless, AreaLightWidth, AreaLightColumns)
#local latRad = radians(Lat);
#local lonRad = radians(-Lon)-CameraTheta;
#local sinLat = sin(latRad);
#local cosLat = cos(latRad);
#local sinLon = sin(lonRad);
#local cosLon = cos(lonRad);
#local lightVectorSize = 2*LDXRadius;
light_source {
	<lightVectorSize*((-sinLon)*cosLat),lightVectorSize*(-sinLat),lightVectorSize*(-cosLon)*cosLat> + LDXCenter
	color rgb <1,1,1>*LightPower
	#if (Shadowless = 0)

	#else
		shadowless
	#end
}
#end
// Lights
// camera fai = -40.10704
// camera theta = 0
WriteLight(60, -60, 0.7, 0, 200, 5)
WriteLight(80, 60, 0.3, 0, 200, 3)


#macro LDXSeamMatrix(Width, Height, Depth, CenterX, CenterY, CenterZ)
#local aw = 0;
#local ah = 0;
#local ad = 0;
#local ax = 0;
#local ay = 0;
#local az = 0;
#if (Width != 0)
#local aw = 1-LDXSW/Width;
#end
#if (Height != 0)
#local ah = 1-LDXSW/Height;
#end
#if (Depth != 0)
#local ad = 1-LDXSW/Depth;
#end
#if (Width != 0 & CenterX != 0)
#local ax = LDXSW/(Width / CenterX);
#end
#if (Height != 0 & CenterY != 0)
#local ay = LDXSW/(Height / CenterY);
#end
#if (Depth != 0 & CenterZ != 0)
#local az = LDXSW/(Depth / CenterZ);
#end
#if (aw <= 0)
#local aw = 1;
#local ax = 0;
#end
#if (ah <= 0)
#local ah = 1;
#local ay = 0;
#end
#if (ad <= 0)
#local ad = 1;
#local az = 0;
#end
matrix <aw,0,0,0,ah,0,0,0,ad,ax,ay,az>
#end


background { color rgb <LDXBgR,LDXBgG,LDXBgB> }

#include "lg_color.inc"

#ifndef (LDXColor7) // Light Gray
#declare LDXColor7 = #if (version >= 3.1) material { #end
	texture {
		lg_grey
	}
#if (version >= 3.1) } #end
#declare LDXColor7_slope = #if (version >= 3.1) material { #end
	texture {
		lg_grey
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor15) // White
#declare LDXColor15 = #if (version >= 3.1) material { #end
	texture {
		lg_white
	}
#if (version >= 3.1) } #end
#declare LDXColor15_slope = #if (version >= 3.1) material { #end
	texture {
		lg_white
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor151) // Very Light Bluish Gray
#declare LDXColor151 = #if (version >= 3.1) material { #end
	texture {
		lg_very_light_bluish_grey
	}
#if (version >= 3.1) } #end
#declare LDXColor151_slope = #if (version >= 3.1) material { #end
	texture {
		lg_very_light_bluish_grey
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor71) // Light Bluish Gray
#declare LDXColor71 = #if (version >= 3.1) material { #end
	texture {
		lg_bluish_grey
	}
#if (version >= 3.1) } #end
#declare LDXColor71_slope = #if (version >= 3.1) material { #end
	texture {
		lg_bluish_grey
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor8) // Dark Gray
#declare LDXColor8 = #if (version >= 3.1) material { #end
	texture {
		lg_dark_grey
	}
#if (version >= 3.1) } #end
#declare LDXColor8_slope = #if (version >= 3.1) material { #end
	texture {
		lg_dark_grey
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor4) // Red
#declare LDXColor4 = #if (version >= 3.1) material { #end
	texture {
		lg_red
	}
#if (version >= 3.1) } #end
#declare LDXColor4_slope = #if (version >= 3.1) material { #end
	texture {
		lg_red
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor10) // Bright Green
#declare LDXColor10 = #if (version >= 3.1) material { #end
	texture {
		lg_bright_green
	}
#if (version >= 3.1) } #end
#declare LDXColor10_slope = #if (version >= 3.1) material { #end
	texture {
		lg_bright_green
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor1) // Blue
#declare LDXColor1 = #if (version >= 3.1) material { #end
	texture {
		lg_blue
	}
#if (version >= 3.1) } #end
#declare LDXColor1_slope = #if (version >= 3.1) material { #end
	texture {
		lg_blue
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor0) // Black
#declare LDXColor0 = #if (version >= 3.1) material { #end
	texture {
		lg_black
	}
#if (version >= 3.1) } #end
#declare LDXColor0_slope = #if (version >= 3.1) material { #end
	texture {
		lg_black
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor69) // Light Purple
#declare LDXColor69 = #if (version >= 3.1) material { #end
	texture {
		lg_bright_purple
	}
#if (version >= 3.1) } #end
#declare LDXColor69_slope = #if (version >= 3.1) material { #end
	texture {
		lg_bright_purple
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor226) // Bright Light Yellow
#declare LDXColor226 = #if (version >= 3.1) material { #end
	texture {
		lg_bright_light_yellow
	}
#if (version >= 3.1) } #end
#declare LDXColor226_slope = #if (version >= 3.1) material { #end
	texture {
		lg_bright_light_yellow
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXColor29) // Bright Pink
#declare LDXColor29 = #if (version >= 3.1) material { #end
	texture {
		lg_light_purple
	}
#if (version >= 3.1) } #end
#declare LDXColor29_slope = #if (version >= 3.1) material { #end
	texture {
		lg_light_purple
		#if (LDXQual > 1) normal { bumps 0.3 scale 25*0.02 } #end
	}
#if (version >= 3.1) } #end
#end

#ifndef (LDXSkipOpaqueColorMacro)
#macro LDXOpaqueColor(r, g, b)
#if (version >= 3.1) material { #end
	texture {
		pigment { srgbf <r,g,b,0> }
#if (LDXQual > 1)
		finish { ambient LDXAmb diffuse LDXDif }
		finish { phong LDXPhong phong_size LDXPhongS reflection LDXRefl }
#end
	}
#if (version >= 3.1) } #end
#end
#end

#ifndef (LDXColor219) // Lilac
#declare LDXColor219 = LDXOpaqueColor(0.337255,0.305882,0.615686)
#end

#include "lg_defs.inc"

#include "lg_3005.inc" // Brick 1 x 1

#include "lg_3031.inc" // Plate 4 x 4

#declare studio_root = union {
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-70,-24,30>
		#if (version >= 3.1) material #else texture #end { LDXColor15 }
	}
	object {
		lg_3031
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(80, 12, 80, 0, 2, 0)
		matrix <1,0,0,0,1,0,0,0,1,-40,0,0>
		#if (version >= 3.1) material #else texture #end { LDXColor15 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-50,-24,30>
		#if (version >= 3.1) material #else texture #end { LDXColor151 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-30,-24,30>
		#if (version >= 3.1) material #else texture #end { LDXColor71 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-10,-24,30>
		#if (version >= 3.1) material #else texture #end { LDXColor8 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-70,-24,10>
		#if (version >= 3.1) material #else texture #end { LDXColor4 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-50,-24,10>
		#if (version >= 3.1) material #else texture #end { LDXColor10 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-30,-24,10>
		#if (version >= 3.1) material #else texture #end { LDXColor1 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-10,-24,10>
		#if (version >= 3.1) material #else texture #end { LDXColor0 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-70,-24,-10>
		#if (version >= 3.1) material #else texture #end { LDXColor69 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-70,-24,-30>
		#if (version >= 3.1) material #else texture #end { LDXColor226 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-50,-24,-10>
		#if (version >= 3.1) material #else texture #end { LDXColor29 }
	}
	object {
		lg_3005
		matrix <0,0,-25,-25,0,0,0,-25,0,0,0,0>
		LDXSeamMatrix(20, 28, 20, 0, 10, 0)
		matrix <1,0,0,0,1,0,0,0,1,-30,-24,-10>
		#if (version >= 3.1) material #else texture #end { LDXColor219 }
	}
#if (LDXRefls = 0)
	no_reflection
#end
#if (LDXShads = 0)
	no_shadow
#end
}

// studio_root
object {
	studio_root
	#if (version >= 3.1) material #else texture #end { LDXColor7 }
}

// Floor
#if (LDXFloor != 0)
object {
	plane { LDXFloorAxis, LDXFloorLoc hollow }
	texture {
		pigment { color rgb <LDXFloorR,LDXFloorG,LDXFloorB> }
		finish { ambient LDXFloorAmb diffuse LDXFloorDif }
	}
}
#end

