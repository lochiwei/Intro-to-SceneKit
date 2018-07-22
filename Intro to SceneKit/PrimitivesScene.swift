//
//  PrimitivesScene.swift
//  Intro to SceneKit
//
//  Created by pegasus on 2018/07/22.
//  Copyright © 2018年 Lo Chiwei. All rights reserved.
//

import SceneKit
import Vectors

class PrimitivesScene: SCNScene {
    
    // MARK: - init
    
    override init() {
        super.init()
        setupScene()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScene()
    }
    
    func setupScene() {
        spawnNodes()
//        putGridOfBalls()
//        put3Spheres()
//        putGridOfBalls()
        print("Primitives Scene init ...")
    }
    
    func spawnNodes(mode:Int = 0) {
//        return
        rootNode.childNodes.forEach { $0.removeFromParentNode() }
        switch mode {
        case 0: put3Spheres()
        case 1: putBallsOnAxis()
        case 2: putBallsFromSmallToBig(number: 10, radius: 0.5, increment: 0.3)
        case 3: putGridOfBalls()
        default: put3Spheres()
        }
    }
    
    func putNode(geometry: SCNGeometry, color:UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), at position:SCNVector3? = nil)  {
        let node = SCNNode(geometry: geometry)
        node.geometry?.materials.first?.diffuse.contents = color
        if let p = position { node.position = p }
        rootNode.addChildNode(node)
    }
    
    // MARK: - Scene
    
    func put3Spheres() {
        putNode(geometry: SCNSphere(radius: 1))
        putNode(geometry: SCNSphere(radius: 0.5), color: #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1), at: [3,0,0])
        putNode(geometry: SCNSphere(radius: 1.5), color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), at: [0,3,0])
    }
    
    func putBallsOnAxis(number n: Int = 20, radius r:CGFloat = 1, padding p:CGFloat = 0.2) {
        for i in 0...(n-1) {
            let sphere = SCNSphere(radius: r)
            let color = (i % 2 == 0) ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
            let w = 2*r + p
            let x = w*i - (n-1)*(w/2)
            putNode(geometry: sphere, color: color, at: [x, 0, 0])
        }
    }
    
    func putBallsFromSmallToBig(number n:Int = 10, radius a:CGFloat = 1, increment d:CGFloat = 0.1)  {
        let len = (n-1)*(2*a + (n-1)*d)
        for k in 0...(n-1) {
            let culumated = k*(2*a + k*d)
            let x = culumated - (len/2)
            let r = CGFloat(a + k*d)
            let s = SCNSphere(radius: r)
            let c = (k % 2 == 0) ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
            putNode(geometry: s, color: c, at: [x, 0, 0])
        }
    }
    
    func putGridOfBalls() {
        
        let n = 20
        let r = CGFloat(1.0)
        let x0 = -(n-1)*r
        
        for k in 0...399 {
            let i = k / n
            let j = k % n
            let x = x0 + i*2*r
            let y = x0 + j*2*r
            let s = SCNSphere(radius: r)
            let c = ((i+j) % 2 == 0) ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
            putNode(geometry: s, color: c, at: [x, y, 0])
        }
    }
    
}
