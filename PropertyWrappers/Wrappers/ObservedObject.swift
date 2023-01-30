//
//  ObservedObject.swift
//  PropertyWrappers
//
//  Created by Артём Скрипкин on 29.01.2023.
//

import SwiftUI



class PlayerState: ObservableObject {
    @Published var isPlaying = false {
        didSet {
            if !isPlaying {
                songName = "Not playing"
            }
        }
    }
    @Published var songName = "Not playing" {
        didSet {
            if songName != "Not playing" {
                isPlaying = true
            }
        }
    }
}

struct ObservedObjectWrapper: View {

    @ObservedObject var playerState = PlayerState()

    var body: some View {
        VStack {
            SongsList(playerState: playerState, selectedSong: playerState.songName)
            PlayerView(playerState: playerState)
        }
    }
}

private struct SongsList: View {

    @ObservedObject var playerState: PlayerState
    @State var selectedSong: String
    @State var pickerLabel = "Please choose a song"
    var songs = ["Red", "Green", "Blue", "Tartan", "Not playing"]

    var body: some View {
        List {
            Picker(pickerLabel, selection: $selectedSong) {
                ForEach(songs, id: \.self) {
                    Text($0)
                }
            }
        }
        .onChange(of: selectedSong) { newSong in
            playerState.songName = newSong
        }
        .onChange(of: playerState.songName) { changedSong in
            if changedSong == "Not playing" {
                selectedSong = changedSong
            }
        }
        .onChange(of: playerState.isPlaying) { isPlaying in
            if isPlaying {
                pickerLabel = "Selected song:"
                if selectedSong == "Not playing" {
                    selectedSong = songs.randomElement()!
                }
            } else {
                pickerLabel = "Please choose a song"
            }
        }
    }
}

private struct PlayerView: View {

    @ObservedObject var playerState: PlayerState

    var body: some View {
        HStack {
            Image(systemName: playerState.isPlaying ? "stop.fill" : "play.fill")
                .frame(width: 60, height: 60)
                .fixedSize()
                .padding(.trailing, 20)
                .onTapGesture {
                    playerState.isPlaying.toggle()
                }
            Text(playerState.songName)
                .frame(height: 60)
        }
        .frame(height: 60)
    }
}
