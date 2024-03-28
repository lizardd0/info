//
//  ContentView.swift
//  infoVk
//
//  Created by Елизавета Шерман on 28.03.2024.
//

import SwiftUI

struct ContentView: View {
    var serviceManager = ServiceManager()
    @State var services: ResponseBody?
    
    var body: some View {
            if let services = services {
                ServicesView(services: services.body.services)
            } else {
                LoadingView()
                    .task {
                        do {
                            services = try await serviceManager.getServices()
                        } catch {
                            print("Error getting services: \(error)")
                        }
                    }
            }
    }
}

#Preview {
    ContentView()
}
