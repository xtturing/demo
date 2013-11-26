//
//  TBbuyViewController.h
//  taobaodemo
//
//  Created by admin on 13-11-23.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBbuyViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UIView *barView;
    IBOutlet UIView *addressView;
    IBOutlet UICollectionView *mailView;
    IBOutlet UITableView *buyView;
    IBOutlet UIView *bottomView;
    IBOutlet UIButton *btn1;
    IBOutlet UIButton *btn2;
    IBOutlet UIButton *btn3;
    IBOutlet UIButton *btn4;
    IBOutlet UILabel *lab1;
    IBOutlet UILabel *lab2;
    IBOutlet UILabel *lab3;
    IBOutlet UIView *line;
}
-(IBAction)closeAction:(id)sender;
@end
