//
//  ContentView.swift
//  SwiftChallenge2
//
//  Created by 芥川浩平 on 2023/12/24.
//

import SwiftUI

struct Challenge1View: View {
    @State private var isSunTapped = false
    @State private var isCloudTapped = false
    @State private var isRainTapped = false

    var body: some View {
        VStack {
            HStack(spacing: 40) {
                Button {
                    isSunTapped = true
                } label: {
                    VStack {
                        Image(systemName: "sun.min.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(isSunTapped == true ? Color.orange : Color.black)
                        Text(isSunTapped == true ? "晴れ" : "")
                            .foregroundStyle(Color.black)
                            .font(.headline)
                    }
                }
                Button {
                    isCloudTapped = true
                } label: {
                    VStack {
                        Image(systemName: "cloud.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(isCloudTapped == true ? Color.gray : Color.black)
                        Text(isCloudTapped == true ? "曇り" : "")
                            .foregroundStyle(Color.black)
                            .font(.headline)
                    }
                }
                Button {
                    isRainTapped = true
                } label: {
                    VStack {
                        Image(systemName: "cloud.heavyrain.fill")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(isRainTapped == true ? Color.blue : Color.black)
                        Text(isRainTapped == true ? "雨" : "")
                            .foregroundStyle(Color.black)
                            .font(.headline)
                    }
                }
            }
            Button {
                isSunTapped = false
                isCloudTapped = false
                isRainTapped = false
            } label: {
                Text("リセット")
            }
        }
    }
}

#Preview {
    Challenge1View()
}
