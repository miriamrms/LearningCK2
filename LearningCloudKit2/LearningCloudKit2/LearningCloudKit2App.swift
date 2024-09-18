//
//  LearningCloudKit2App.swift
//  LearningCloudKit2
//
//  Created by Miriam Mendes on 30/08/24.
//

import SwiftUI

@main
struct LearningCloudKit2App: App {
    @StateObject var viewModel: ProductViewModel = ProductViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
