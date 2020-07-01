//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 6/30/20.
//

import SwiftUI

struct Song {
    var title: String
    var artist: String
    var image: String
}

let songs = [
    Song(title: "I'd Do Anything", artist: "Simple Plan", image: "NoPads"),
    Song(title: "All Star", artist: "Smash Mouth", image: "AstroLounge"),
    Song(title: "Slow Jamz", artist: "Kanye West", image: "CollegeDropout")
]



struct ContentView: View {
    @State var spacing: CGFloat = 12
    @State var isExpanded = false
    @State var airplaneEnabled = false
    @State var cellularEnabled = true
    @State var wifiEnabled = true
    @State var notifsEnabled = true
    @State var playMusic = false
    @State var currentSong = 0
    @State var count = (songs.count - 1)
    @State var airplay = false
    @State var brightness: Float
    @State var volume: Float
    
    func changeSong(_ direction: String) -> Int {
        if direction == "previous" {
            currentSong -= 1
        } else {
            currentSong += 1
        }
        if currentSong < 0 {
            currentSong = count
        }
        if currentSong > count {
            currentSong = 0
        }
        
        return currentSong
        
    }
    
    
    
    var body: some View {
        VStack {
            //Album Art
            VStack(spacing: self.spacing) {
                HStack(spacing: self.spacing) {
                    Image(songs[currentSong].image)
                        .resizable()
                        .frame(width: 290, height: 290)
                        .cornerRadius(12.0)
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
            //Control Center
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
                            Button(action: {self.airplay.toggle() } ) {
                                Image(systemName: "airplayaudio")
                                    .foregroundColor(Color(airplay ? UIColor.systemBlue : UIColor.systemGray))
                                    .opacity(airplay ? 1 : 0.5)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        Text(songs[currentSong].title)
                            .font(.subheadline).bold().padding(.bottom, -5.0)
                        Text(songs[currentSong].artist)
                            .font(.callout)
                            .foregroundColor(Color(UIColor.systemGray))
                            .padding(0)
                        HStack{
                            Button(action: {_ = self.changeSong("previous") } ) {
                                Image(systemName: "backward.fill")
                            }
                                .padding(2)
                            .buttonStyle(PlainButtonStyle())
                            Button(action: {self.playMusic.toggle() } ) {
                                Image(systemName: self.playMusic ? "pause.fill" : "play.fill")
                                    .resizable()
                                    .frame(width:15, height: 20)
                                    .padding()
                            }
                            .buttonStyle(PlainButtonStyle())
                            Button(action: {_ = self.changeSong("next") } ) {
                                Image(systemName: "forward.fill")
                            }
                                .padding(2)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding(12.0)
                .frame(width: 150.0, height: 150.0)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(24.0)
                
                Spacer()
            }
            //Brightness
 
                    
                    
            HStack {
                Spacer()
                VStack(spacing: 24) {
                    
                    HStack{
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(Color(UIColor.white))
                                .opacity(0.8)
                                .frame(width: geometry.size.width * CGFloat(self.brightness / 100))
                                .gesture(DragGesture(minimumDistance: 0)
                                        .onChanged({value in
                                            self.brightness = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                                        })
                                )
                                
                                
                        }
                    }
                    .overlay(Image(systemName: "sun.max.fill").padding(.bottom, 30.0).rotationEffect(.degrees(90.0)), alignment: .leading)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(24.0)
                    .frame(width: 140.0, height: 60)
//                    .padding(12)
                    
                    
                    HStack{
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(Color(UIColor.white))
                                .opacity(0.8)
                                .frame(width: geometry.size.width * CGFloat(self.volume / 100))
                                .gesture(DragGesture(minimumDistance: 0)
                                        .onChanged({value in
                                            self.volume = min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)
                                        })
                                )
                        }
                    }
                    .overlay(Image(systemName: "speaker.3.fill").padding(.bottom, 30.0).rotationEffect(.degrees(90.0)), alignment: .leading)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(24.0)
                    .frame(width: 140.0, height: 60)
                    
                    
                }
                .padding(.top, -30.0)
                .rotationEffect(.degrees(-90.0))
                
            }
            .padding()
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(brightness: 100.0, volume: 100.0)
            .preferredColorScheme(.dark)
    }
}
