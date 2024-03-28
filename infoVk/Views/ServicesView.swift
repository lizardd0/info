//
//  ServicesView.swift
//  infoVk
//
//  Created by Елизавета Шерман on 28.03.2024.
//

import SwiftUI

struct ServicesView: View {
    var services: [ServiceModel]
    var body: some View {
        NavigationStack {
            List {
                ForEach(services, id: \.self) { service in
                    
                    Link(destination: URL(string: service.link)!, label: {
                        ServiceRowView(service: service)
                    })
                }
                
            }
            .navigationTitle("Сервисы")
            .preferredColorScheme(.dark)
        }
    }
}

struct ServiceRowView: View {
    let service: ServiceModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: service.icon_url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                LoadingView()
            }
            .frame(width: 72, height: 72)
            VStack(alignment: .leading) {
                Text(service.name)
                    .foregroundColor(.white)
                Text(service.description).font(.caption).foregroundStyle(.secondary).foregroundColor(.white)
            }
        }
    }
}

