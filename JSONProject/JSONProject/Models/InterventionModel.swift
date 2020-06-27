//
//  InterventionModel.swift
//  JSONProject
//
//  Created by David Cruz on 6/19/20.
//  Copyright © 2020 David Cruz. All rights reserved.
//

import Foundation

struct InterventionType:Codable{
    var T: String // this is needed for color zones type 1 = red..
    var Interventions: [Intervention]?
}
struct Intervention:Codable {
    var N:String
    var CS:[String]?
    var L: String
    var TD: String
}
 
// struct for tableviews
struct InterventionSelectableItem{
    var _Inter: Intervention!
    var _available: Bool? //
}
