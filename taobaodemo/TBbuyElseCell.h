//
//  TBbuyElseCell.h
//  taobaodemo
//
//  Created by admin on 13-11-25.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBbuyElseCell : UITableViewCell{
    IBOutlet UILabel *titleLab;
    IBOutlet UILabel *detailLab;
    IBOutlet UIView *line;
}
@property (nonatomic ,copy) NSString *titleText;
@property (nonatomic ,copy) NSString *detailtext;

@end
