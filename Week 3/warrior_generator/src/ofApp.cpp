#include "ofApp.h"
ofColor color1, color2, color3, color4;
int armRand;
int legRand;
int faceShapeRand;
int faceRand;
int classRand ;
int imageCounter = 0;
ofImage img;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetBackgroundAuto(true);
    ofSetRectMode(OF_RECTMODE_CENTER);
    ofEnableSmoothing();
    ofSetFrameRate(60);
//    color1.setHex(0xecf4f3);
//    color2.setHex(0x68b0ab);
//    color3.setHex(0x006a71);
//    color4.setHex(0xff7e67);
    
    initializeSvgs();
    armRand = 3;
    legRand = 0;
    faceShapeRand = 3;
    faceRand = 3;
    classRand = 2;
    
}

//--------------------------------------------------------------
void ofApp::update(){

    if (ofGetFrameNum()% 60 == 0) {
        armGenerator();
        legGenerator();
        faceShapeGenerator();
        faceGenerator();
        classGenerator();
    }
//    if (ofGetFrameNum()%10 == 0) {
//        img.grabScreen(0, 0 , ofGetWidth(), ofGetHeight());
//        string saveStr ="screenshot" + ofToString(imageCounter) + ".png";
//        img.save(saveStr);
//        imageCounter++;
//    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofClear(color1);
    
    classBackDisplay();
    armDisplay();
    legDisplay();
    faceShapeDisplay();
    faceDisplay();
    classFrontDisplay();

}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
    if(key == '1') { armGenerator();}
    if(key == '2') { legGenerator();}
    if(key == '3') { faceShapeGenerator();}
    if(key == '4') { faceGenerator();}
    if(key == '5') { classGenerator();}
}

void ofApp::initializeSvgs() {
    
    f1.load("f1.svg");
    f2.load("f2.svg");
    f3.load("f3.svg");
    f4.load("f4.svg");
    f5.load("f5.svg");
    
    fs1.load("fs1.svg");
    fs2.load("fs2.svg");
    fs3.load("fs3.svg");
    fs4.load("fs4.svg");
    fs5.load("fs5.svg");
    
    b1.load("b1.svg");
    b2.load("b2.svg");
    b3.load("b3.svg");
    b4.load("b4.svg");
    b5.load("b5.svg");
    
    a1.load("a1.svg");
    a2.load("a2.svg");
    a3.load("a3.svg");
    a4.load("a4.svg");
    a5.load("a5.svg");
    
    ft1.load("ft1.svg");
    ft2.load("ft2.svg");
    ft3.load("ft3.svg");
    ft4.load("ft4.svg");
    ft5.load("ft5.svg");
    
    l1.load("l1.svg");
    l2.load("l2.svg");
    l3.load("l3.svg");
    l4.load("l4.svg");
    l5.load("l5.svg");
    
}

void ofApp::armDisplay() {
    switch (armRand) {
       case 0:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-a1.getWidth()/2,-a1.getHeight()/2);
            a1.draw();
            ofPopMatrix();
            break;
        case 1:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-a4.getWidth()/2,-a2.getHeight()/2);
            a2.draw();
            ofPopMatrix();
            break;
        case 2:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-10-a3.getWidth()/2,20-a3.getHeight()/2);
            a3.draw();
            ofPopMatrix();
            break;
        case 3:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-a4.getWidth()/2,20-a4.getHeight()/2);
            a4.draw();
            ofPopMatrix();
            break;
        case 4:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2.4);
            ofTranslate(-a5.getWidth()/2,10-a5.getHeight()/2);
            a5.draw();
            ofPopMatrix();
            break;
    }
}
void ofApp::legDisplay() {
    switch (legRand) {
          case 0:
               ofPushMatrix();
               ofTranslate(ofGetWidth()/2,
                           ofGetHeight()/2);
               ofScale(2);
               ofTranslate(-l1.getWidth()/2,55-l1.getHeight()/2);
               l1.draw();
               ofPopMatrix();
               break;
           case 1:
               ofPushMatrix();
               ofTranslate(ofGetWidth()/2,
                           ofGetHeight()/2);
               ofScale(2);
               ofTranslate(-l4.getWidth()/2,60-l2.getHeight()/2);
               l2.draw();
               ofPopMatrix();
               break;
           case 2:
               ofPushMatrix();
               ofTranslate(ofGetWidth()/2,
                           ofGetHeight()/2);
               ofScale(2);
               ofTranslate(30-l3.getWidth()/2,60-l3.getHeight()/2);
               l3.draw();
               ofPopMatrix();
               break;
           case 3:
               ofPushMatrix();
               ofTranslate(ofGetWidth()/2,
                           ofGetHeight()/2);
               ofScale(2);
               ofTranslate(10-l4.getWidth()/2,50-l4.getHeight()/2);
               l4.draw();
               ofPopMatrix();
               break;
           case 4:
               ofPushMatrix();
               ofTranslate(ofGetWidth()/2,
                           ofGetHeight()/2);
               ofScale(2);
               ofTranslate(10-l5.getWidth()/2,60-l5.getHeight()/2);
               l5.draw();
               ofPopMatrix();
               break;
    }
    
}
void ofApp::faceShapeDisplay() {
    switch (faceShapeRand) {
        case 0:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-fs1.getWidth()/2,-fs1.getHeight()/2);
            fs1.draw();
            ofPopMatrix();
            break;
        case 1:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-fs4.getWidth()/2,-fs2.getHeight()/2);
            fs2.draw();
            ofPopMatrix();
            break;
        case 2:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-fs3.getWidth()/2,-fs3.getHeight()/2);
            fs3.draw();
            ofPopMatrix();
            break;
        case 3:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-fs4.getWidth()/2,-fs4.getHeight()/2);
            fs4.draw();
            ofPopMatrix();
            break;
        case 4:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-fs5.getWidth()/2,-fs5.getHeight()/2);
            fs5.draw();
            ofPopMatrix();
            break;
            
    }
}
void ofApp::faceDisplay() {
    switch (faceRand) {
            
        case 0:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-f1.getWidth()/2,-f1.getHeight()/2);
            f1.draw();
            ofPopMatrix();
            break;
        case 1:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-f4.getWidth()/2,-f2.getHeight()/2);
            f2.draw();
            ofPopMatrix();
            break;
        case 2:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-f3.getWidth()/2,-f3.getHeight()/2);
            f3.draw();
            ofPopMatrix();
            break;
        case 3:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-f4.getWidth()/2,-f4.getHeight()/2);
            f4.draw();
            ofPopMatrix();
            break;
        case 4:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-f5.getWidth()/2,-f5.getHeight()/2);
            f5.draw();
            ofPopMatrix();
            break;
    
    }
}
void ofApp::classFrontDisplay() {
    switch (classRand) {
        case 0:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(1.5);
            ofTranslate(-90-ft1.getWidth()/2,-ft1.getHeight()/2);
            ft1.draw();
            ofPopMatrix();
            break;
        case 1:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-70-ft4.getWidth()/2,-10-ft2.getHeight()/2);
            ft2.draw();
            ofPopMatrix();
            break;
        case 2:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-ft3.getWidth()/2,-25-ft3.getHeight()/2);
            ft3.draw();
            ofPopMatrix();
            break;
        case 3:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-80-ft4.getWidth()/2,-ft4.getHeight()/2);
            ft4.draw();
            ofPopMatrix();
            break;
        case 4:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-85-ft5.getWidth()/2,-ft5.getHeight()/2);
            ft5.draw();
            ofPopMatrix();
            break;
    }
}
void ofApp::classBackDisplay() {
    switch (classRand) {
       case 0: //sorceror
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(80-b1.getWidth()/2,-b1.getHeight()/2);
            b1.draw();
            ofPopMatrix();
            break;
        case 1:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(-2,1);
            ofTranslate(-10-b4.getWidth()/2,60-b2.getHeight()/2);
            b2.draw();
            ofPopMatrix();
            break;
        case 2: //rogue
            ofPushMatrix();
            
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            
            ofScale(2);
            
            ofTranslate(120-b3.getWidth()/2,-b3.getHeight()/2);
            ofRotateDeg(30);
            b3.draw();
            ofPopMatrix();
            break;
        case 3:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofTranslate(-b4.getWidth()/2,-25-b4.getHeight()/2);
            b4.draw();
            ofPopMatrix();
            break;
        case 4:
            ofPushMatrix();
            ofTranslate(ofGetWidth()/2,
                        ofGetHeight()/2);
            ofScale(2);
            ofRotateDeg(30);
            ofTranslate(30-b5.getWidth()/2,-b5.getHeight()/2);
            b5.draw();
            ofPopMatrix();
            break;
    }
}

void ofApp::armGenerator() {
    armRand = int(ofRandom(5));
    cout << "armRand: " << armRand << endl;
}
void ofApp::legGenerator() {
    legRand = int(ofRandom(5));
    cout << "legRand: " << legRand << endl;
}
void ofApp::faceShapeGenerator() {
    faceShapeRand = int(ofRandom(5));
    cout << "faceShapeRand: " << faceShapeRand << endl;
}
void ofApp::faceGenerator() {
    faceRand = int(ofRandom(5));
    cout << "faceRand: " << faceRand << endl;
}
void ofApp::classGenerator() {
    classRand = int(ofRandom(5));
    cout << "classRand: " << classRand << endl;
}




