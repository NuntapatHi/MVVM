//
//  UserCell.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 11/4/2567 BE.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    private var personIcons = ["person.circle.fill", "person.circle"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func config(_ user: UserEntity){
        userIconImageView.image = UIImage(systemName: personIcons.shuffled().first ?? "questionmark")
        usernameLabel.text = user.name
    }
    
}
