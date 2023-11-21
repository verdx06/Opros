//
//  OprosView.swift
//  learn2
//
//  Created by Виталий Багаутдинов on 21.11.2023.
//

import SwiftUI

struct OprosView: View {
    
    @State private var text = ""
    @State private var textFields: [String] = [""] // Массив для хранения значений текстовых полей
    @State private var displayedText: String = "" // Для отображения значений на экране
    
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
                                // Убираем одно текстовое поле
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
                                // Добавляем новое текстовое поле при нажатии кнопки
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
                        
                        ForEach(0..<textFields.count, id: \.self) { index in
                            TextField("Введите вариант...", text: self.$textFields[index])
                                .padding()
                                .background(Color.gray.opacity(0.2).cornerRadius(10))
                        }
                    } //поля
                    
                    Button(action: {
                        //
                    }, label: {
                        Text("Save".uppercased())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundColor(.white)
                            .font(.headline)
                            .clipShape(.capsule(style: .continuous))
                    })
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Создание опроса")
            }
        }
    }
}

struct BordTextField: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
        }
        .padding(.leading)
        .foregroundColor(.black)
    }
}




#Preview {
    OprosView()
}
