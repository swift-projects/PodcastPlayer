//
//  StoryDetailYoutubeElementCell.swift
//  DemoApp-iOS
//
//  Created by Albin CR on 2/13/17.
//  Copyright © 2017 Albin CR. All rights reserved.
//

import UIKit
import YouTubePlayer
import Quintype

class StoryDetailYoutubeElementCell: BaseCollectionCell {
    
    var youtubeView:YouTubePlayerView = {
        
        let view = YouTubePlayerView()
        return view
        
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
         let view = self.contentView
view.backgroundColor = readThemeColorPlist(colorName: colors.defaultCellBackgroundColor.rawValue)
        view.addSubview(youtubeView)
        youtubeView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
    
    override func configure(data: Any?) {
        let card = data as? CardStoryElement

        if let stringUrl:String = card?.url {
            
            if let url = URL(string: stringUrl){
                
                youtubeView.loadVideoURL(url)
                
            }
            
        }
       

        
    }
    
    
    override func calculateHeight(targetSize: CGSize) -> CGSize {
        let playerWidth = targetSize.width
        let playerHeight = (9.0/16.0) * playerWidth
        return CGSize(width: targetSize.width, height: playerHeight + 15)
        
    }
    
}