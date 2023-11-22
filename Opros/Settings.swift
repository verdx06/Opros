//
//  Settings.swift
//  Opros
//
//  Created by Виталий Багаутдинов on 22.11.2023.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ForApp()) {
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundColor(Color.background)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding()
                        HStack{
                            Image("forapp")
                                .resizable()
                                .frame(width: 45, height: 45)
                            Text("О приложении")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        } .padding(.leading)
                        
                    }
                }
                Spacer()
            }.navigationTitle("Настройки")
        }
    }
}

struct ForApp: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("О разработчике")
                .padding(.leading)
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundColor(Color.background)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
                .overlay {
                    VStack (alignment: .leading){
                        Text("Багаутдинов Виталий Ринатович")
                            .font(.system(size: 20))
                        HStack {
                            Image("telegramm")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("@bi3nesman")
                        }
                        HStack {
                            Image("vk")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("vk.com/gghhdu")
                        }
                    }
                }
            Spacer()
        }
    }
}

#Preview {
    Settings()
}
