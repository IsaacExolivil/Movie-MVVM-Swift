//
//
//  Created by Jose Isaac Chin López 20 de febrero
//  Copyright © 2022 All rights reserved.
//
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cover.layer.cornerRadius = 16
    }

}
