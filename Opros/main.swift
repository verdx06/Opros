//
//  Main.swift
//  Opros
//
//  Created by Виталий Багаутдинов on 22.11.2023.
//

import SwiftUI

class UserNameOpros: ObservableObject {
    @Published var name: String = ""
}

struct Main: View {
    
    @ObservedObject var nameOpros = UserNameOpros()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    NavigationLink(destination: CreateOpros()) {
                        
                        ZStack {
                            Image(systemName: "macwindow.badge.plus")
                                .resizable()
                                .frame(width: 45, height: 40)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Create")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 50)
                            
                        }
                    }
                    Spacer()
                    Text("\(nameOpros.name)")
                } .navigationTitle("Главная страница")
            }
        }
        .environmentObject(nameOpros)
    }
}


#Preview {
    Main()
}
