//
//  CellRow.swift
//  QuakesApp
//
//  Created by Cong Fandi on 15/12/19.
//  Copyright © 2019 Cong Fandi. All rights reserved.
//

import SwiftUI

struct CellRow: View {
    var data : Futures
    var body: some View {
        HStack(alignment: .center, spacing: 9){
            VStack(alignment: .leading){
                Text(String(data.properties.mag))
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
            }.frame(width:100,height:100)
                .background(Color.green)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray,lineWidth: 1))
                .shadow(radius: 10)
            VStack{
                Text(data.properties.place)
                    .foregroundColor(.gray)
                    .bold()
                
                Text("Time : \(convertTime(timesTamp: data.properties.time))")
                    .italic()
                    .foregroundColor(.orange)
                    .padding(.top,2)
            }
        }
    }
    
    func convertTime(timesTamp : Double) -> String {
        let uniqTime = timesTamp / 1000
        let date = Date(timeIntervalSince1970: uniqTime)
        
        let dateFormatter  = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+7")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd MMM yy hh:mm a"
        
        return dateFormatter.string(from: date)
    }
}


