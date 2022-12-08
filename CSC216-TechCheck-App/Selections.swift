//
//  Selections.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 1/12/2022.
//

import Foundation

struct Building: Identifiable {
    let buildingList: [String]
    let id = UUID()
    
    init() {
        self.buildingList = ["Hutch", "Morey", "Hoyt", "Harkness", "Gavett"]
    }
    
    func findRoom(building: String) -> [String] {
        switch building {
        case "Hutch":
            return ["112", "122", "123"]
        case "Morey":
            return ["212", "222", "223"]
        case "Hoyt":
            return ["312", "322", "323"]
        case "Harkness":
            return ["412", "422", "423"]
        case "Gavett":
            return ["512", "522", "523"]
        default:
            return ["Please pick a room"]
        }
    }
}

struct Problem: Identifiable {
    
    let problemList: [String]
    let id = UUID()
    
    init () {
        self.problemList = ["Computer", "Monitor"]
    }
}

struct Solutions: Identifiable {
    init () {
        self.solutionList =  [
            [
                "Find the charger for the laptop",
                "Find the port outlet for the laptop",
                "Plug in the port in both ends",
                "You're finished!"
            ],
            [
                "Find the screen",
                "Tap the screen",
                "Tap the screen again!",
                "You're finished!"
            ]
        ]
        
        self.buttonList = [
            [
                "Next",
                "Next",
                "Next",
                "Finished"
            ],
            [
                "Next",
                "Next",
                "Next",
                "Finished"
            ]
        ]
    }
    
    let solutionList: [[String]]
    let buttonList: [[String]]
    
    let id = UUID()
    
    func findSolutions(problem: String) -> [String] {
        switch problem {
        case "Computer":
            return solutionList[0]
        case "Monitor":
            return solutionList[1]
        default:
            return ["WTF Happened Here"]
        }
    }
    
    func findButton(problem: String) -> [String] {
        switch problem {
        case "Computer":
            return buttonList[0]
        case "Monitor":
            return buttonList[1]
        default:
            return ["WTF Happened Here"]
        }
    }
}
