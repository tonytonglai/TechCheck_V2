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
    
    @IBAction func onPickIssue(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "problemSelection") as! ProblemSelectionViewController
        myVC.overallRoom = self.overallRoom
        myVC.objectScanned = self.finalObject
    }
    
    // TODO: stretch goal, conditionally render the "pick issue" button. Only allow for it to be clickable/different oolor when an object is detected
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(overallRoom)
        scannerBackgroundBorder.layer.cornerRadius = 10
        scannerBackgroundBorder.layer.shadowOpacity = 0.3
        scannerBackgroundBorder.layer.shadowColor = UIColor.black.cgColor
        scannerBackgroundBorder.layer.shadowRadius = 10
        scannerBackgroundBorder.layer.shadowOffset = .zero
        scannerBackgroundBorder.layer.shadowPath = UIBezierPath(rect: scannerBackgroundBorder.bounds).cgPath
//        scannerBackgroundBorder.layer.shouldRasterize = true
        
        let Meliora = try! Meliora.loadSchoolText()
        let LowBattery = try! LowBattery.loadBatteryIcon()
        
        let session = arView.session
        
        var mel: UUID? = Meliora.anchorIdentifier
        var low = LowBattery.anchorIdentifier
        
        arView.scene.anchors.append(Meliora)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            print("Timer fired! Also overall room is \(overallRoom)")

            mel = Meliora.anchorIdentifier
            low = LowBattery.anchorIdentifier
            
            if (mel != nil) {
                print("mel is here")
                self.finalObject = "schoolLogo"
                print("finalObject is \(finalObject)")
                // seems like the UUID is useless. just use the conditionals to check here.
                timer.invalidate()
            }

            if (low != nil) {
                print("low battery it is!")
                self.finalObject = "batteryIcon"
                print("finalObject is \(finalObject)")
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