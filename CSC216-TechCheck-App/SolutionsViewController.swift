//
//  SolutionsViewController.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 7/12/2022.
//

import UIKit
import RealityKit

class SolutionsViewController: UIViewController, ScreenDelegate {

    var itemSelection = ""
    var problemSelection = ""
    let solutions = Solutions()
    
    // creating the relevant Scenes...
    let laptopScene = try! Laptop.loadScene()
    let AppleChargerScene = try! AppleCharger.loadScene()
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var instructionLabel: UILabel!
    
    private var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // actually, let me try this.
        instructionLabel.text = solutions.findSolutions(problem: problemSelection)[counter]
        rightButtonUI.setTitle(solutions.findButton(problem: problemSelection)[counter], for: .normal)
        renderAnchor(currStage: counter, problemSelection: problemSelection)
    }
    		
    func didHitNext(currStage: Int, problemSelection: String) {
        instructionLabel.text = solutions.findSolutions(problem: problemSelection)[currStage]
        rightButtonUI.setTitle(solutions.findButton(problem: problemSelection)[currStage], for: .normal)
    }
    
    @IBAction func onRightButton(_ sender: Any) {
        if (counter > 2) {
            renderAnchor(currStage: counter, problemSelection: problemSelection)
            rightButtonUI.setTitle("Finish", for: .normal)
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            counter += 1
            renderAnchor(currStage: counter, problemSelection: problemSelection)
            instructionLabel.text = solutions.findSolutions(problem: problemSelection)[counter]
            rightButtonUI.setTitle(solutions.findButton(problem: problemSelection)[counter], for: .normal)
        }
    }
    
    @IBOutlet weak var rightButtonUI: UIButton!
    // ok so we're at the last bit now... I just need to actually ensure that we can do this.
    // so at every state, I want it to hold three things:
        // 1. the actual thing it's highlighting
        // 2. text at the top to inform the user about what to do next
        // 3. a "next button" to indicate what the next step should be.
    // how tf do i do that in UIKit?
    
    // basically, I think we should let there be a variable anchor. What it will anchor to DEPENDS on what state we're in.
    // and for each state, I think it should correspond with a different textField, and different
    
    func renderAnchor(currStage: Int, problemSelection: String) {
        if (problemSelection == "Computer") {
            if (currStage == 0) {
                // arView.scene.anchors.append()
                arView.scene.anchors.append(AppleChargerScene)
            }
            if (currStage == 1) {
                arView.scene.anchors.remove(AppleChargerScene)
                arView.scene.anchors.append(laptopScene)
            }
            if (currStage == 2) {
                // append the first anchor.
                arView.scene.anchors.append(AppleChargerScene)
            }
            if (currStage == 3) {
                arView.scene.anchors.remove(laptopScene)
                arView.scene.anchors.remove(AppleChargerScene)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
