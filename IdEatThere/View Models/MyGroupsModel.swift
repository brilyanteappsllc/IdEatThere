//
//  MyGroupsModel.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 1/9/23.
//

import Foundation
import Combine
import SwiftUI
import Firebase


class MyGroupsModel : ObservableObject {
    
    
    
    @Published var hasGroups : Bool = true
    
    @Published var groupsArray : Array = []
    
    private let groupsDataService = GroupsDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        
        addSubscribers()
    }
    
    
    func addSubscribers() {
        
        
        groupsDataService.$groupsArray
            .sink { [weak self] (returnedgroupsArray) in
                self?.groupsArray = returnedgroupsArray
            }
            .store(in: &cancellables)
                
        
        
    }
    
    
    
    
}
