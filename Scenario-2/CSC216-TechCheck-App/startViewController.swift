//
//  startViewController.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 29/11/2022.
//

import UIKit

class startViewController: UIViewController {

    @IBOutlet weak var commonProblemsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onIdentifyPress(_ sender: Any) {
        // below code seemed a little unnecessary...
        // perhaps it was abstracted away already?
        
        //        performSegue(withIdentifier: "ToRoomSelectionsViewController", sender: nil)
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
