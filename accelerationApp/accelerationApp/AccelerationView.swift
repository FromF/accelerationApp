//
//  AccelerationView.swift
//  accelerationApp
//
//  Created by 藤治仁 on 2022/05/29.
//

import SwiftUI

struct AccelerationView: View {
    @StateObject private var viewModel = AccelerationViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.acceX) \(viewModel.acceY) \(viewModel.acceZ) ")
                .padding()
            if viewModel.isStarted {
                Button {
                    viewModel.stop()
                } label: {
                    Text("stop")
                }
            } else {
                Button {
                    viewModel.start()
                } label: {
                    Text("start")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccelerationView()
    }
}
