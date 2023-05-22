//
//  ContentView.swift
//  Dice
//
//  Created by 指原奈々 on 2023/05/17.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber = 1
    @State private var timer: Timer?
    @State private var isRolling = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable() //画像の大きさを変更するときは駆らなずこのモディファイア
                .scaledToFit() //画像の縦横の比率を固定するというモディファイア
                .frame(width: UIScreen.main.bounds.width/2)
                .padding() // 内側に余白を付けています
            Spacer()
            Button {
                playDice()
            } label: {
                Text("サイコロをふる")
                    .padding()
                    .background(.orange)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .disabled(isRolling)
            Spacer()
        }
        .padding()
    }
    
    func playDice() {
            print("ボタンが押された")
            isRolling = true
            timer = Timer.scheduledTimer(withTimeInterval:0.1, repeats:true) {_ in
                randomNumber = Int.random(in: 1...6)
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            timer?.invalidate()
            timer = nil
            isRolling = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
