//
//  TBmailCell.h
//  taobaodemo
//
//  Created by admin on 13-11-25.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBmailCell : UICollectionViewCell{
    IBOutlet UIImageView *mailImg;
}
@property(nonatomic,copy) NSString *imgText;
@end
