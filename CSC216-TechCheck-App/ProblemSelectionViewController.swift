//
//  ProblemSelectionViewController.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 6/12/2022.
//

import UIKit
import CoreData

class ProblemSelectionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let ProblemModel = Problem()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var problems:[ProblemEntity]?
    
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
    
    func fetchProblem() {
        do {
            // can do assignment here... We don't need to currently do anything with it... But, it will prove useful later
            self.problems = try context.fetch(ProblemEntity.fetchRequest())
        } catch {
            print("Uh oh! Error.")
        }
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
        
        // creating coredata instance
        let newProblem = ProblemEntity(context: self.context)
        newProblem.roomSelection = overallRoom
        newProblem.itemSelection = objectScanned
        newProblem.problemSelection = pickedProblem
        
        // saving coredata instance
        do {
            try self.context.save()
        } catch {
            
        }
        
        // fetching coredata instance
        self.fetchProblem()
        
        // debugging/checking.
        print(problems!.count)
        problems!.forEach{ problem in
            print(problem)
        }
        
        // OH THIS IS SO SEXY!!! OH I LOVE THIS LITTLE FUNCTION!!! BE CAREFUL WITH THIS THOUGH!!!
        self.navigationController?.popToRootViewController(animated: true)
        
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
