//
//  ProjectsView.swift
//  BerkinPortfolio
//
//  Created by Berkin Sili on 19.01.2022.
//

import SwiftUI

struct ProjectsView: View {
    let showClosedPorjects: Bool
    let projects: FetchRequest<Project>
    
    init(showClosedPorjects: Bool) {
        self.showClosedPorjects = showClosedPorjects
        projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)], predicate: NSPredicate(format: "closed = %d", showClosedPorjects))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(projects.wrappedValue) { project in
                    Section(header: Text(project.projectTitle)) {
                        ForEach(project.projectItems) { item in
                            Text(item.itemTitle)
                            
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showClosedPorjects ? "Closed Projects" : "Open Projects")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var dataController = DataController.preview
     
    static var previews: some View {
        ProjectsView(showClosedPorjects: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
