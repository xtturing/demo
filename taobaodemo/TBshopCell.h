//
//  TBshopCell.h
//  taobaodemo
//
//  Created by admin on 13-11-22.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StrikeThroughLabel.h"
@interface TBshopCell : UITableViewCell<UIPopoverControllerDelegate>{
    IBOutlet UIButton *check;
    IBOutlet UIView *imgView;
    IBOutlet UILabel *titleLab;
    IBOutlet UILabel *detailLab;
    IBOutlet UIButton *numbtn;
    IBOutlet StrikeThroughLabel *pLab1;
    IBOutlet UILabel *pLab2;
    IBOutlet UILabel *plab3;
    IBOutlet UIView *line3;
    Boolean isCheck;
    UIPopoverController *popover;
}
@property(nonatomic,copy) NSString *imageText;
-(IBAction)moreOther:(id)sender;
@end
