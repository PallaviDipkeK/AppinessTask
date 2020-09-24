//
//  HomeViewModel.swift
//  AppinessTask
//
//  Created by mobiotics1067 on 22/09/20.
//  Copyright © 2020 Private. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Properties Initializer
    var notLeapModel: [UserResponse]? = [UserResponse]()
    func getDataFromJson(){
        if let path = Bundle.main.path(forResource: "Userdata", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode(UserResponseModel?.self, from: data)
                let userModel = (jsonResult?.userResponse?.sorted { $0.dob ?? "" < $1.dob ?? ""})!
                self.filteredData(userMod: userModel)
            } catch {
                print(error)
            }
        }
    }
    
    private func filteredData(userMod: [UserResponse]?){
        guard let userModel = userMod else { return }
        for i in userModel.indices {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            let date = formatter.date(from: userModel[i].dob ?? "")
            formatter.dateFormat = "yyyy"
            let yearString = formatter.string(from: date!)
            if !isLeapYear(year:  Int(yearString) ?? 0) {
                let userMod = UserResponse(name: modifyName(name: userModel[i].name ?? ""), dob: modifyDob(dob: userModel[i].dob ?? ""))
                notLeapModel?.append(userMod)
            }
        }
    }
    
    func modifyName(name: String) -> String {
        return "Name:- \(name)"
    }
    
    func modifyDob(dob: String) -> String {
        return "DOB:- \(dob)"
    }
    
    func isLeapYear(year:Int) -> Bool {
        if  (year <=  1918 &&  !(year % 4 == 0))  || (year > 1918 && !(year % 4 == 0) && (year < 1918 || year % 100 == 0 || !(year % 400 == 0))){
            return false
        }
        return true
    }
}

