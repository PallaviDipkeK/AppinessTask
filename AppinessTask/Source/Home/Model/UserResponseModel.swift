//
//  UserResponseModel.swift
//  AppinessTask
//
//  Created by mobiotics1067 on 22/09/20.
//  Copyright © 2020 Private. All rights reserved.
//

import Foundation

class UserResponseModel: Decodable {
    var userResponse: [UserResponse]?
    enum RegisterCodingKeys : CodingKey{
        case userResponse 
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RegisterCodingKeys.self)
        userResponse = try (container.decodeIfPresent([UserResponse].self, forKey: .userResponse))
    }
}

class UserResponse: Codable {
    var name,dob: String?
    enum RegisterCodingKeys : String, CodingKey{
        case name = "name"
        case dob = "dob"
    }
    init(name: String, dob: String) {
        self.name = name
        self.dob = dob
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RegisterCodingKeys.self)
        name = try (container.decodeIfPresent(String.self, forKey: .name))
        dob = try (container.decodeIfPresent(String.self, forKey: .dob))
    }
    
}


