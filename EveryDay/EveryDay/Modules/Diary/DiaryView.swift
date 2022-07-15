//
//  DiaryView.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 23.06.22.
//

import SwiftUI

struct DiaryView: View {
    @State private var date = Date()
    @State private var testText: String = ""
    var body: some View {
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

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
