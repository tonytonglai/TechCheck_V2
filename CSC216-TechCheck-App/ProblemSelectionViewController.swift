//
//  ProblemSelectionViewController.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 6/12/2022.
//

import UIKit

class ProblemSelectionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let ProblemModel = Problem()
    var pickedProblem = ""
    var overallRoom = ""
    var objectScanned = ""
    
    @IBOutlet weak var problemPickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ProblemModel.problemList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedProblem = ProblemModel.problemList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ProblemModel.problemList[row]
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        problemPickerView.delegate = self
        problemPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTechCheck(_ sender: Any) {
        print(overallRoom)
        print(objectScanned)
        print(pickedProblem)
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
