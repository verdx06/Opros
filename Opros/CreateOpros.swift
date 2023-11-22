//
//  OprosView.swift
//  learn2
//
//  Created by Виталий Багаутдинов on 21.11.2023.
//

import SwiftUI

struct CreateOpros: View {
    
    @State private var text: String = ""
    @State private var viewtext: String = ""
    @State private var textFields: [String] = [""]
    @State private var displayedText: [String] = []
    @State private var isNextViewActive = false
    
    @EnvironmentObject var nameOpros: UserNameOpros
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    Text("Тема опроса")
                    TextField("Название опроса...", text: $text)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                    Text("Варианты ответа")
                    
                    VStack {
                        HStack {
                            Button(action: {
                                if self.textFields.count > 1 {
                                    self.textFields.removeLast()
                                }
                            }) {
                                if self.textFields.count > 1 {
                                    Image(systemName: "minus.circle.fill")
                                } else {
                                    Image(systemName: "minus.circle.fill").foregroundColor(.gray)
                                }
                            } .frame(maxWidth: .infinity, alignment: .trailing)
                            Button(action: {
                                if textFields.count < 10 {
                                    self.textFields.append("")
                                }
                            }) {
                                if textFields.count < 10 {
                                    Image(systemName: "plus.circle.fill")
                                } else {
                                    Image(systemName: "plus.circle.fill").foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    
                    ForEach(0..<textFields.count, id: \.self) { index in
                        TextField("Введите вариант...", text: self.$textFields[index])
                            .padding()
                            .background(Color.gray.opacity(0.2).cornerRadius(10))
                    }
                }
                
                
                
                Button(action: {
                    self.nameOpros.name = self.text
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    Text("save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .clipShape(.capsule(style: .continuous))
                })
//                Text(viewtext)
//                    .font(.largeTitle)
//                ForEach(displayedText, id: \.self) { text in
//                    Button {
//                        //
//                    } label: {
//                        Text(text)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    
//                }
                
                Spacer()
            }
            .padding()
        }
    }
}






#Preview {
    CreateOpros()
}
