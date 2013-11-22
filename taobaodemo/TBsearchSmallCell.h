//
//  TBsearchSmallCell.h
//  taobaodemo
//
//  Created by admin on 13-11-19.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBsearchSmallCell :  UICollectionViewCell
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
