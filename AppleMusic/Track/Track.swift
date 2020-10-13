//
//  Track.swift
//  AppleMusic
//
//  Created by 권성우 on 2020/10/11.
//  Copyright © 2020 swkwon. All rights reserved.
//

import Foundation
import UIKit

struct Track {
    let title: String
    let artist: String
    let albumName: String
    let artwork: UIImage
    
    init(title: String, artist: String, albumName: String, artWork: UIImage) {
        self.title = title
        self.artist = artist
        self.artwork = artWork
        self.albumName = albumName
    }
}

struct Album {
    let title: String
    let tracks: [Track]
    
    var thumbnail: UIImage? {
        return tracks.first?.artwork
    }
    
    var artist: String? {
        return tracks.first?.artist
    }
    
    init(title: String, tracks: [Track]) {
        self.title = title
        self.tracks = tracks
    }
}
