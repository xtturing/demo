//
//  TBShopViewController.h
//  taobaodemo
//
//  Created by admin on 13-11-22.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBShopViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIView *topView;
    IBOutlet UIView *bottomView;
    IBOutlet UITableView *myTableView;
    IBOutlet UIButton *check;
    IBOutlet UIButton *titlebtn;
    IBOutlet UILabel *numLab;
    IBOutlet UIButton *moveBtn;
    IBOutlet UIButton *deleteBtn;
    IBOutlet UILabel *allLab;
    IBOutlet UILabel *priceLab;
    IBOutlet UIButton *buyBtn;
}
-(IBAction)buyAction:(id)sender;
@end
