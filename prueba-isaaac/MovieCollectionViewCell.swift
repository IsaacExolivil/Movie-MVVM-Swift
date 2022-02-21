//
//  MovieCollectionViewCell.swift
//  mvvm-movies
//
//  Created by Rodrigo Giglio on 15/08/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import UIKit



class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var rating: UILabel!
    var textTitle: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cover.layer.cornerRadius = 16
    }
    
}
