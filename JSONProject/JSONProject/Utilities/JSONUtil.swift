//
//  JSONUtil.swift
//  JSONProject
//
//  Created by David Cruz on 6/19/20.
//  Copyright © 2020 David Cruz. All rights reserved.
//

import Foundation


func DecodeInterventions(filePath: String)->[InterventionType]?{
    do {
        guard let fileURL = Bundle.main.url(forResource: filePath, withExtension: "json") else{
            print("could not find the file")
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let content  = try Data(contentsOf: fileURL)
            let interventions = try decoder.decode([InterventionType].self, from: content)
            return interventions
        }catch let error{
            print(error)
            return nil
        }
        
    }catch let error{
        print(error)
        return nil
    }
}
