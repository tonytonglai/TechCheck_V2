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
        let session = arView.session
        
        var ai: UUID? = Meliora.anchorIdentifier
        
        arView.scene.anchors.append(Meliora)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")

            ai = Meliora.anchorIdentifier
            
            if (ai != nil) {
                print("HUZZAH")
                timer.invalidate()
            }

            print(ai)
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
