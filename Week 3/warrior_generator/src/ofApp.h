#pragma once

#include "ofMain.h"
#include "ofxSvg.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

        void initializeSvgs();
        void armGenerator();
        void legGenerator();
        void faceShapeGenerator();
        void faceGenerator();
        void classGenerator();
    
    void armDisplay();
    void legDisplay();
    void faceShapeDisplay();
    void faceDisplay();
    void classFrontDisplay();
    void classBackDisplay();
    
		void keyPressed(int key);
		void keyReleased(int key);
    
        ofxSVG              f1, f2, f3, f4, f5,
                            fs1, fs2, fs3, fs4, fs5,
                            a1, a2, a3, a4, a5,
                            b1, b2, b3, b4, b5,
                            ft1, ft2, ft3, ft4, ft5,
                            l1, l2, l3, l4, l5;

};
