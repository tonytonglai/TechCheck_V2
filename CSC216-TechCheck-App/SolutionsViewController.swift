//
//  SolutionsViewController.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 7/12/2022.
//

import UIKit
import RealityKit

class SolutionsViewController: UIViewController {

    var itemSelection = ""
    var problemSelection = "Computer"
    let solutions = Solutions()
    
    // creating the relevant Scenes...
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var instructionLabel: UILabel!
    
    func loadAllScenes(currStage: Int, problemSelection:String) {
        let laptopScene = try! Laptop.loadScene()
        let macbookProScene = try! MacbookPro.loadScene()
        let AppleChargerScene = try! AppleCharger.loadScene()
        let lowBatteryDesktopScene = try! LowBatteryDesktop.loadScene()
        
        if (problemSelection == "Computer") {
            if (currStage == 0) {
                // arView.scene.anchors.append()
                print("In currStage 0")
                DispatchQueue.main.async {
                    self.arView.scene.anchors.append(AppleChargerScene)
                    self.arView.scene.anchors.append(lowBatteryDesktopScene)
                }
            }
            if (currStage == 1) {
                print("In currStage 1")
                DispatchQueue.main.async {
                    self.arView.scene.anchors.removeAll()
                    self.arView.scene.anchors.append(macbookProScene)
                }
                
            }
            if (currStage == 2) {
                // append the first anchor.
                print("In currStage 2")
                DispatchQueue.main.async {
                    self.arView.scene.anchors.append(lowBatteryDesktopScene)
                    self.arView.scene.anchors.append(AppleChargerScene)
                }
            }
            if (currStage == 3) {
                print("In currStage 3")
                DispatchQueue.main.async {
                    self.arView.scene.anchors.removeAll()
                }
            }
        }
    }
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // actually, let me try this.
        instructionLabel.text = solutions.findSolutions(problem: problemSelection)[counter]
        rightButtonUI.setTitle(solutions.findButton(problem: problemSelection)[counter], for: .normal)
        loadAllScenes(currStage: counter, problemSelection: problemSelection)
        
    }
    
    @IBAction func onRightButton(_ sender: Any) {
        if (counter > 2) {
            loadAllScenes(currStage: counter, problemSelection: problemSelection)
            rightButtonUI.setTitle("Finish", for: .normal)
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            counter += 1
            loadAllScenes(currStage: counter, problemSelection: problemSelection)
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
    
//    func renderAnchor(currStage: Int, problemSelection: String) {
//        print("renderAnchor Called")
//        if (problemSelection == "Computer") {
//            if (currStage == 0) {
//                // arView.scene.anchors.append()
//                print("In currStage 0")
//                DispatchQueue.main.async {
//                    self.arView.scene.anchors.append(self.AppleChargerScene)
//                    self.arView.scene.anchors.append(self.lowBatteryDesktopScene)
//                }
//            }
//            if (currStage == 1) {
//                print("In currStage 1")
//                DispatchQueue.main.async {
//                    self.arView.scene.anchors.remove(self.AppleChargerScene)
//                    self.arView.scene.anchors.append(self.macbookProScene)
//                }
//
//            }
//            if (currStage == 2) {
//                // append the first anchor.
//                print("In currStage 2")
//                DispatchQueue.main.async {
//                    self.arView.scene.anchors.append(self.AppleChargerScene)
//                }
//            }
//            if (currStage == 3) {
//                print("In currStage 3")
//                DispatchQueue.main.async {
//                    self.arView.scene.anchors.remove(macbookProScene)
//                    self.arView.scene.anchors.remove(AppleChargerScene)
//                }
//            }
//        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


