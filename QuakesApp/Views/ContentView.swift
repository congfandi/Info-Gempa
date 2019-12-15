//
//  ContentView.swift
//  QuakesApp
//
//  Created by Cong Fandi on 30/11/19.
//  Copyright © 2019 Cong Fandi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkingManager  = NetworkingManager()
    var body: some View {
        NavigationView{
            List(networkingManager.dataList.features,id: \.properties){ data in
                NavigationLink(destination: DetailView(data: data)){
                    CellRow(data: data)
                }.navigationBarTitle("Info Gempa")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
