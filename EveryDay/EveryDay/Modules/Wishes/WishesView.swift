//
//  WishesView.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 23.06.22.
//

import SwiftUI

struct WishesView: View {
    @State private var date = Date()
    @State private var testText: String = ""
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false){
//            VStack(spacing: 20){
//                CustomDatePicker(currentDate: $date)
//            }
//        }
        ScrollView(){
                    DatePicker(
                            "Start Date",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                    .foregroundColor(.red)
                    .datePickerStyle(.graphical)
        //            .foregroundColor(.red)
        //            .foregroundColor(UIColor(hex: "FFECF5"))
        //            .background(UIColor(hex: "FFECF5"))
                    VStack() {
                        Text("Я благодарна за:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextEditor(text: $testText)
                            .frame(height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                            .textFieldStyle(.roundedBorder)

                        Text("Положительная установка на день:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextEditor(text: $testText)
                            .frame(height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                            .textFieldStyle(.roundedBorder)

                        Text("Прекрасные события, которые произошли со мной сегодня:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextEditor(text: $testText)
                            .frame(height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                            .textFieldStyle(.roundedBorder)

                        Text("Заметки:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        TextEditor(text: $testText)
                            .frame(height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                            .textFieldStyle(.roundedBorder)

                        HStack(){
                            Button{

                            } label:{
                                Image(systemName: "plus.circle")
                            }
                            Text("Привычка")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .bottom])
        //                ZStack{
        //                    TextEditor(text: $username)
        ////                        .border(.red, width: 1)
        //                        .textFieldStyle(.roundedBorder)
        //                    Text(username).opacity(0).padding(.all, 8)
        //                }
        //                .border(.cyan, width: 1)
        //                .cornerRadius(25)
        //                TextField("ASD", text: $username)
        //                    .lineLimit(2)
        //                TextField("test", text: $username)
        //                    .textFieldStyle(.roundedBorder)
                    }



                }
                .padding([.top, .leading, .trailing])
    }
}

struct WishesView_Previews: PreviewProvider {
    static var previews: some View {
        WishesView()
    }
}
