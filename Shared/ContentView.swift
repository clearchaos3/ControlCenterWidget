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
    @State var playMusic = false
    
    
    var body: some View {
        HStack {
            Spacer()
            //Controls
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
            Spacer()
            //Music
            VStack(spacing: self.spacing) {
                
                VStack(spacing: 8) {
                    HStack {
                        Spacer()
                        Image(systemName: "airplayaudio")
                            .opacity(0.5)
                    }
                    Text("I'd Do Anything")
                        .font(.subheadline).bold().padding(.bottom, -5.0)
                    Text("Simple Plan")
                        .font(.callout)
                        .foregroundColor(Color(UIColor.systemGray))
                        .padding(0)
                    HStack{
                        Image(systemName: "backward.fill")
                            .padding(2)
                        Button(action: {self.playMusic.toggle() } ) {
                            Image(systemName: self.playMusic ? "pause.fill" : "play.fill")
                                .resizable()
                                .frame(width:15, height: 20)
                                .padding()
                        }
                        .buttonStyle(PlainButtonStyle())
                        Image(systemName: "forward.fill")
                            .padding(2)
                    }
                }
            }
            .padding(12.0)
            .frame(width: 150.0, height: 150.0)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(24.0)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
