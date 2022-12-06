//
//  roomSelectionViewController.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 29/11/2022.
//

import UIKit
import CoreData

class roomSelectionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let BuildingModel = Building()
    let defaults = UserDefaults.standard
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func scanIssueButton(_ sender: Any) {
        let finalRoom = pickedBuilding + "/" + pickedRoom
        let myVC = storyboard?.instantiateViewController(withIdentifier: "objectScanner") as! ObjectScannerViewController
        myVC.overallRoom = finalRoom
        navigationController?.pushViewController(myVC, animated: true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) {
            return BuildingModel.buildingList.count
        } else {
            return 3
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            pickedBuilding = BuildingModel.buildingList[row]
        } else {
            pickedRoom = BuildingModel.findRoom(building: pickedBuilding)[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            return BuildingModel.buildingList[row]
        } else {
            return BuildingModel.findRoom(building: pickedBuilding)[row]
        }
    }
    
    func fetchProblem() {
        do {
            // can do assignment here... We don't need to currently do anything with it... But, it will prove useful later
            try context.fetch(ProblemEntity.fetchRequest())
        } catch {
            print("Uh oh! Error.")
        }
    }
    
    var pickedBuilding: String = "Hutch"
    var pickedRoom: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildingPicker.delegate = self
        buildingPicker.dataSource = self
        
        roomPicker.delegate = self
        roomPicker.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var buildingPicker: UIPickerView!
    
    @IBOutlet weak var roomPicker: UIPickerView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
