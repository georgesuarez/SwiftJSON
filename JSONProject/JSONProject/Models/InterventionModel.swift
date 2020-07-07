//
//  InterventionModel.swift
//  JSONProject
//
//  Created by David Cruz on 6/19/20.
//  Copyright © 2020 David Cruz. All rights reserved.
//

import Foundation

struct InterventionType:Codable{
    var type: String // this is needed for color zones type 1 = red..
    var interventions: [Intervention]?
}
struct Intervention: Codable {
    var name: String
    var choices: [String]?
    var videoLink: String
    var textDescription: String
}
 
// struct for tableviews
struct InterventionSelectableItem{
    var _Inter: Intervention!
    var _available: Bool? 
}
