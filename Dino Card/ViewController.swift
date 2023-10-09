//
//  ViewController.swift
//  Dino Card
//
//  Created by Manu on 2023-08-14.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self

        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Dino Cards", bundle: Bundle.main){
            
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 2
            
            print("Image Succesfully Added")
            
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        
        if let imageAnchor = anchor as? ARImageAnchor{
            print(imageAnchor.referenceImage.name!)
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
           
                node.addChildNode(planeNode)
            if  imageAnchor.referenceImage.name! ==  "trex"{
                if let dinoScene = SCNScene(named: "art.scnassets/trex.scn"){
                    if let dinoNode = dinoScene.rootNode.childNodes.first{
                      
                            planeNode.addChildNode(dinoNode)
                            dinoNode.eulerAngles.x = .pi / 2
                    }
                }
            }
            
            if  imageAnchor.referenceImage.name! ==  "compsognathus"{
                if let dinoScene = SCNScene(named: "art.scnassets/compsognathus.scn"){
                    if let dinoNode = dinoScene.rootNode.childNodes.first{
                       
                            planeNode.addChildNode(dinoNode)
                            dinoNode.eulerAngles.x = .pi / 2
                    }
                }
            }
        }
        return node
    }

}
