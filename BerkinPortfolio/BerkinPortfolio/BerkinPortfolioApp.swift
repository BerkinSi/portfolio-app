//
//  BerkinPortfolioApp.swift
//  BerkinPortfolio
//
//  Created by Berkin Sili on 15.01.2022.
//

import SwiftUI

@main
struct BerkinPortfolioApp: App {
    
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: save(_:))
        }
    }
    
    func save(_ notification: Notification){
        dataController.save()
    }
}
