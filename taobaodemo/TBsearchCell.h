//
//  TBsearchCell.h
//  taobaodemo
//
//  Created by admin on 13-11-15.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBsearchCell : UICollectionViewCell
{
    IBOutlet UIView *image;
    IBOutlet UILabel *title;
    IBOutlet UILabel *price;
    IBOutlet UILabel *sell;
    IBOutlet UILabel *comment;
}
@property(nonatomic,copy) NSString *imageText;
@property(nonatomic,copy) NSString  *titleText;
@property(nonatomic,copy) NSString  *priceText;
@property(nonatomic,copy) NSString  *sellText;
@property(nonatomic,copy) NSString  *commentText;
@end
