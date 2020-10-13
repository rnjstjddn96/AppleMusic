//
//  TrackManager.swift
//  AppleMusic
//
//  Created by 권성우 on 2020/10/11.
//  Copyright © 2020 swkwon. All rights reserved.
//

import UIKit
import AVFoundation

class TrackManager {
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    init() {
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }
    
    func loadTracks() -> [AVPlayerItem] {
        guard let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) else { return [] }
        let items = urls.map { AVPlayerItem(url: $0) }
        return items
    }
       
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        let track = playerItem.convertToTrack()
        return track
    }
    
    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap{ $0.convertToTrack() }
        let albumDics = Dictionary(grouping: trackList, by: { track in
            track.albumName
        })
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }
    
    func loadOtherTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
}
