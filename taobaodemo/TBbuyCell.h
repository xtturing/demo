//
//  TBbuyCell.h
//  taobaodemo
//
//  Created by admin on 13-11-23.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBbuyCell : UITableViewCell{
    IBOutlet UIView *imgView;
    IBOutlet UILabel *titleLab;
    IBOutlet UILabel *detailLab;
    IBOutlet UILabel *priceLab;
    IBOutlet UILabel *totalLab;
    IBOutlet UIButton *saleBtn;
    IBOutlet UIView *line;
}
@property(nonatomic,copy) NSString *imageText;
@end
