//
//  CellPost.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation
import UIKit

final class CellPost:UITableViewCell{
    
    //MARK: - Outlets
    @IBOutlet private weak var labelPostTitle:UILabel!
    @IBOutlet private weak var labelCreateDate:UILabel!
    @IBOutlet weak var switchActiveDeactive:UISwitch!
   
    //MARK: - Variables
    var posthint:Hits?{
        didSet{
            if let hint = self.posthint{
                if let title = hint.title{
                    self.labelPostTitle.text = title;
                }
                if let createdat = hint.created_at{
                    let formate = DateFormatter();
                    formate.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS'Z'"
                    formate.timeZone = TimeZone.current;
                    if let creatdt = formate.date(from: createdat){
                        let displayformate = DateFormatter()
                        displayformate.dateFormat = "E, d MMM yyyy hh:mm:ss a";
                        self.labelCreateDate.text = displayformate.string(from: creatdt);
                    }
                }
                self.switchActiveDeactive.isOn = hint.isActive;
            }
        }
    }
    
}
