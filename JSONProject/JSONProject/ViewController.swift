//
//  ViewController.swift
//  JSONProject
//
//  Created by David Cruz on 6/15/20.
//  Copyright © 2020 David Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var RetrievedInterventions: [InterventionType]?
    private var RedInterventions: [Intervention]?
    
    private var InterventionArray: [InterventionSelectableItem]?
    private var tierLevel = 0 // free tier
    private var currentState = 1 // current color zone red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        RetrievedInterventions = DecodeInterventions(filePath: "DailyExercises")
        //RetrievedInterventions?.forEach({print($0)})
        // go through RetrievedInterventions and if certain tier level make some not available
        RetrievedInterventions?.forEach({
            let x = String(currentState)
            if($0.T == x){
                var i = 0
                var iCount = $0.Interventions?.count
                var allowed = iCount!/2 // only allowed half if tier level free
                $0.Interventions?.forEach({
                    if(tierLevel == 0 && i<=allowed){
                        InterventionArray?.append(InterventionSelectableItem(_Inter: $0, _available: true))
                    }else{
                        InterventionArray?.append(InterventionSelectableItem(_Inter: $0, _available: false))
                    }
                    i+=1;
                })
            }
        })
        
    }
    
    func encode(user: User) -> Data?{
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            return data
        } catch let error{
            print(error)
            return nil
        }
    }
    
    func decodeFromFile(filePath: String)->[User]?{
        do {
            guard let fileURL = Bundle.main.url(forResource: filePath, withExtension: "json") else{
                print("could not find the file")
                return nil
            }
            do {
                let decoder = JSONDecoder()
                let content  = try Data(contentsOf: fileURL)
                let users = try decoder.decode([User].self, from: content)
                return users
            }catch let error{
                print(error)
                return nil
            }
            
        }catch let error{
            print(error)
            return nil
        }
    }
    
    


}

