//
//  ObjectScannerViewController.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 3/12/2022.
//

import UIKit
import RealityKit

class ObjectScannerViewController: UIViewController {

    @IBOutlet weak var tempPicker: UIPickerView!
    
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var scannerBackgroundBorder: CardView!
    var overallRoom: String = ""
    var finalObject: String = ""
    
    func removingView() {
        self.arView?.session.pause()            // there's no session on macOS
        self.arView?.session.delegate = nil     // there's no session on macOS
        self.arView?.scene.anchors.removeAll()
        self.arView?.removeFromSuperview()
        self.arView?.window?.resignKey()
        self.arView = nil
    }
    
    
    @IBAction func onPickIssue(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "problemSelection") as! ProblemSelectionViewController
        myVC.overallRoom = self.overallRoom
        myVC.objectScanned = self.finalObject
        self.arView.scene.anchors.removeAll()
        removingView()
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    // TODO: stretch goal, conditionally render the "pick issue" button. Only allow for it to be clickable/different oolor when an object is detected
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scannerBackgroundBorder.layer.cornerRadius = 10
        scannerBackgroundBorder.layer.shadowOpacity = 0.3
        scannerBackgroundBorder.layer.shadowColor = UIColor.black.cgColor
        scannerBackgroundBorder.layer.shadowRadius = 10
        scannerBackgroundBorder.layer.shadowOffset = .zero
        scannerBackgroundBorder.layer.shadowPath = UIBezierPath(rect: scannerBackgroundBorder.bounds).cgPath
//        scannerBackgroundBorder.layer.shouldRasterize = true
        
        let Meliora = try! Meliora.loadSchoolText()
        let LowBattery = try! LowBattery.loadBatteryIcon()
        let LowBatteryDesktopScene = try! LowBatteryDesktop.loadScene()
        
        var mel: UUID? = Meliora.anchorIdentifier
        var low = LowBattery.anchorIdentifier
        var lowdesk = LowBatteryDesktopScene.anchorIdentifier
        
        arView.scene.anchors.append(Meliora)
        arView.scene.anchors.append(LowBatteryDesktopScene)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            print("Timer fired!")

            mel = Meliora.anchorIdentifier
            low = LowBattery.anchorIdentifier
            lowdesk = LowBatteryDesktopScene.anchorIdentifier
            
            if (mel != nil) {
                self.finalObject = "schoolLogo"
                // seems like the UUID is useless. just use the conditionals to check here.
                timer.invalidate()
            }

            if (low != nil) {
                self.finalObject = "batteryIcon"
                timer.invalidate()
            }
            
            if (lowdesk != nil) {
                self.finalObject = "batteryIcon"
                timer.invalidate()
            }
            
        }
        // Do any additional setup after loading the view.
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
