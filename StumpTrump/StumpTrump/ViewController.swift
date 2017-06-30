//
//  ViewController.swift
//  StumpTrump
//
//  Created by Charles Kang on 6/29/17.
//  Copyright © 2017 Charles Kang. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    var buttonStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, didAdd node: SKNode, for anchor: ARAnchor) {
        let faces: SKSpriteNode = [
            SKSpriteNode(imageNamed: "trumpface-1.png"),
            SKSpriteNode(imageNamed: "trumpface-2.png"),
            SKSpriteNode(imageNamed: "trumpface-3.png"),
            SKSpriteNode(imageNamed: "trumpface-4.png"),
            SKSpriteNode(imageNamed: "trumpface-5.png"),
            SKSpriteNode(imageNamed: "trumpface-6.png"),
            SKSpriteNode(imageNamed: "trumpface-7.png"),
            SKSpriteNode(imageNamed: "trumpface-9.png"),
            SKSpriteNode(imageNamed: "trumpface-10.png")
            ].randomItem()
        
        node.addChild(faces)
        faces.zRotation = .pi/4.0
    }
}
