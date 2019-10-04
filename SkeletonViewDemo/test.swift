//
//  test.swift
//  SkeletonViewDemo
//
//  Created by Manmeetsingh Sethi on 26/08/19.
//  Copyright © 2019 Manmeetsingh Sethi. All rights reserved.
//

import UIKit
import SkeletonView

class test: UIViewController {
    
    
    @IBOutlet weak var viewtest:UIView!
    @IBOutlet weak var viewlbl:UILabel!
    @IBOutlet weak var lbl:UILabel!
    @IBOutlet weak var imgview:UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewtest.showAnimatedGradientSkeleton()
        viewlbl.showAnimatedGradientSkeleton()
        imgview.showAnimatedSkeleton()
        lbl.showAnimatedSkeleton()
    }

}
