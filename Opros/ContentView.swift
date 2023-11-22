//
//  ContentView.swift
//  learn2
//
//  Created by Виталий Багаутдинов on 21.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectTab = "Main"
    
    let tabs = ["Main","History","Settings"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottom) {
                TabView (selection: $selectTab){
                    Main()
                        .tag("Main")
                    History()
                        .tag("History")
                    Settings()
                        .tag("Settings")
                }
                
                HStack {
                    ForEach(tabs, id: \.self) {tab in
                        TabBarItem(tab: tab, selected: $selectTab)
                    } 
                }
                .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color.background)
            }
        }
    }
}

struct TabBarItem: View{
    
    @State var tab: String
    @Binding var selected: String
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation(.spring) {
                    selected = tab
                }
            }, label: {
                HStack {
                    Image(tab)
                        .resizable()
                        .frame(width: 30, height: 30)
                    if selected == tab {
                            Text(tab)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                    }
                }
            })
        } .opacity(selected == tab ? 1 : 0.7)
        .padding(.vertical, 5)
        .padding(.horizontal, 17)
        .background(selected == tab ? .white : Color(.background))
        .clipShape(Capsule())
    }
}

#Preview {
    ContentView()
}

