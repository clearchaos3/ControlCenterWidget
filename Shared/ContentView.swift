//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 6/30/20.
//

import SwiftUI

struct ContentView: View {
    @State var spacing: CGFloat = 12
    @State var isExpanded = false
    @State var airplaneEnabled = false
    @State var cellularEnabled = true
    @State var wifiEnabled = true
    @State var notifsEnabled = true
    
    var body: some View {
        VStack(spacing: self.spacing) {
            HStack(spacing: self.spacing) {
                Button(action: {self.airplaneEnabled.toggle() } ) {
                    VStack {
                        Ellipse()
                            .foregroundColor(Color(self.airplaneEnabled ? UIColor.systemOrange : UIColor.tertiarySystemGroupedBackground))
                            .overlay(Image(systemName:"airplane"))
                            .frame(width: 52, height: 52)
                        if self.isExpanded {
                            Text("Airplane")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {self.cellularEnabled.toggle() } ) {
                    VStack {
                        Ellipse()
                            .foregroundColor(Color(self.cellularEnabled ? UIColor.systemGreen : UIColor.tertiarySystemGroupedBackground))
                            .overlay(Image(systemName:"antenna.radiowaves.left.and.right"))
                            .frame(width: 52, height: 52)
                        if self.isExpanded {
                            Text("Cellular")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            HStack(spacing: self.spacing) {
                Button(action: {self.wifiEnabled.toggle() } ) {
                    VStack {
                        Ellipse()
                            .foregroundColor(Color(self.wifiEnabled ? UIColor.systemBlue : UIColor.tertiarySystemGroupedBackground))
                            .overlay(Image(systemName: self.wifiEnabled ? "wifi" : "wifi.slash"))
                            .frame(width: 52, height: 52)
                        if self.isExpanded {
                            Text("Wifi")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {self.notifsEnabled.toggle() } ) {
                    VStack {
                        Ellipse()
                            .foregroundColor(Color(UIColor.tertiarySystemGroupedBackground))
                            .overlay(Image(systemName: self.notifsEnabled ? "bell.fill" : "bell.slash.fill"))
                            .frame(width: 52, height: 52)
                        if self.isExpanded {
                            Text("Notifs")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(24.0)
        .onTapGesture {
            withAnimation(
                .easeInOut(duration: 0.25)
            ){
                self.isExpanded.toggle()
                
                if self.isExpanded {
                    self.spacing = 24
                } else {
                    self.spacing = 12
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
