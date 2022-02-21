//
//
//  Created by Jose Isaac Chin López 20 de febrero
//  Copyright © 2022 All rights reserved.
//
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
