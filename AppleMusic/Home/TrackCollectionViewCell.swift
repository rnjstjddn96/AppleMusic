//
//  TrackCollectionViewCell.swift
//  AppleMusic
//
//  Created by 권성우 on 2020/10/11.
//  Copyright © 2020 swkwon. All rights reserved.
//
import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
    static let id: String = "TrackCollectionViewCell"
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 4
        trackArtist.textColor = UIColor.systemGray2
    }
}
