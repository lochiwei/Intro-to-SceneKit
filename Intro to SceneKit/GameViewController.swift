/*
 Reference:
 - https://www.weheartswift.com/introduction-scenekit-part-1/
 
 Key Points:
 - create custom SCNScene subclass so that the scene's logic is self contained.
 */

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var scene: SCNScene!
    private var sceneView: SCNView!
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // create and configure a new scene
        setupSceneView()
        setupScene()
    }
    
    
    // MARK: - Scene
    
    private func setupScene() {
        scene = PrimitivesScene()
        sceneView.scene = scene
    }
    
    private func setupSceneView() {

        // set the scene to the view
        sceneView = view as! SCNView
        
        // configure the view
        sceneView.allowsCameraControl = true
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    // MARK: - View Controller Settings
    
    override var shouldAutorotate: Bool { return true }
    override var prefersStatusBarHidden: Bool { return true }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .phone ? .allButUpsideDown : .all
    }

}// end: GameViewController
