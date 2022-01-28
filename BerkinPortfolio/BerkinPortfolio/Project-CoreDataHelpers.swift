//
//  Project-CoreDataHelpers.swift
//  BerkinPortfolio
//
//  Created by Berkin Sili on 20.01.2022.
//

import Foundation

extension Project {
    
    var projectTitle: String {
        title ?? "Project Title"
    }
    
    var projectDetail: String {
        detail ?? "Detail"
    }
    
    var projectColor: String {
        color ?? "Light Blue"
    }
    
    var projectItems: [Item] {
        let itemsArray = items?.allObjects as? [Item] ?? []
        
        return itemsArray.sorted { first, second in
            if !first.completed && second.completed {
                return true
            }else if first.completed && !second.completed{
                return false
            }
            
            if first.priority > second.priority {
                return true
            }else if second.priority > first.priority {
                return false
            }
            
            return first.itemCreationDate > second.itemCreationDate
        }
    }
    
    var completionAmount: Double {
        let originalItems = items?.allObjects as? [Item] ?? []
        guard !originalItems.isEmpty else{return 0.0}
        
        let completedItems = originalItems.filter(\.completed)
        return Double(completedItems.count)/Double(originalItems.count)
    }
    
    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Example Project"
        project.detail = "This is an example Project"
        project.closed = false
        project.creationDate = Date()
        
        return project
    }
    static let colors = ["Pink", "Purple", "Red", "Orange", "Gold", "Green", "Teal", "Light Blue", "Dark Blue", "Midnight", "Dark Gray", "Gray"]

}
